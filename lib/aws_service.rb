module AwsService

  class AwsService

    def initialize(credentials = {}, region = nil)
      credentials = defaults[:credentials].merge(credentials)
      region ||= defaults[:region]
    end

    def defaults
      {:credentials =>
          {:access_key_id => ENV['AWS_ACCESS_KEY_ID'],
           :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']},
       :region => ENV['AWS_DEFAULT_REGION']}
    end
  end

  class ElasticTranscoderService < AwsService
    def initialize(credentials = {}, region = nil)
      super
      begin
        @elt = Aws::ElasticTranscoder::Client.new(access_key_id: credentials[:access_key_id], 
                                    secret_access_key: credentials[:secret_access_key],
                                    region: region)
      rescue Aws::ElasticTranscoder::Errors::ServiceError => e
        Rails.logger.error "ERROR: #{e}"
      end
    end

    def sync_elt_presets
      begin
      #TODO: The following code can lead to a Throttling exception.
      @elt.list_presets.each do |page|
        page.data.presets.each do |preset|
          begin
            EncodingProfile.find_or_create_by(preset_id: preset.id,
                                            name: preset.name,
                                            description: preset.description)
          rescue StandardError => e
            Rails.logger.error "#{e}"

          end
        end
      end
      rescue Aws::ElasticTranscoder::Errors::ServiceError => e
        Rails.logger.error "#{e}" 
      end
    end

  end

  class SnsService < AwsService

    def initialize(credentials = {}, region = nil)
      super
      begin
        @sns = Aws::SNS::Client.new(access_key_id: credentials[:access_key_id], 
                                    secret_access_key: credentials[:secret_access_key],
                                    region: region)
      rescue Aws::SNS::Errors::ServiceError => e
        Rails.logger.error "ERROR: #{e}"
      end
    end

    def confirm(confirm_subscription_message, sns_topic_arn, sns_auth_on_unsubscribe)
      begin
          notification = Hashie::Mash.new JSON.parse(confirm_subscription_message)
          @sns.confirm_subscription({
          topic_arn: sns_topic_arn,
          token: notification.Token,
          authenticate_on_unsubscribe: sns_auth_on_unsubscribe
        })
     rescue Aws::SNS::Errors::ServiceError => e
       Rails.logger.error "ERROR: #{e}"
     end
    end

    def save_sns_notification(sns_notification)
      notification = Hashie::Mash.new JSON.parse(sns_notification)
      Notification.create(:topic => notification.TopicArn,
                          :subject => notification.Subject,
                          :message => notification.Message)
    end
  end

  class SnsConnectionPool

    include Singleton

    def init_pool(credentials, region, pool_size, max_pending_notifications)
      @pool = Queue.new
      @pool_size = pool_size
      @max_pending_notifications = max_pending_notifications
      @credentials = credentials
      @region = region
      @pool_size.times do
          @pool << single_connection
      end
    end

    def single_connection
      SnsService.new(@credentials, @region)
    end

    def get_sns_connection
      pending_notifications = @pool.num_waiting
      while pending_notifications >= @max_pending_notifications do
        Rails.logger.warning "Maximum number of notifications waiting for processing. Resizing Pool."
        resizing = @pool_size + pending_notifications
        resizing.times do
          @pool << single_connection
        end
      end
      Rails.logger.info "Current pool size #{@pool.size}. Attempting to pop a new connection."
      @pool.pop
    end

    def release_sns_connection(connection)
      Rails.logger.info "Current pool size #{@pool.size}. Releasing a new connection."
      @pool << connection
      Rails.logger.info "Connection released. Current pool size #{@pool.size}."
    end
  end

end
