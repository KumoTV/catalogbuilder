class SnsController < ApplicationController
  protect_from_forgery with: :null_session

  def sns_endpoint
    amz_message_type = request.headers['x-amz-sns-message-type']
    amz_sns_topic = request.headers['x-amz-sns-topic-arn']
    if amz_sns_topic == ::SnsTopicArn
      sns = ::SnsConnectionPool.get_sns_connection
      case amz_message_type
         when "SubscriptionConfirmation"
           Rails.logger.info "Received #{amz_message_type} notification."
           sns.confirm(request.raw_post, ::SnsTopicArn, ::SnsAuthOnUnsubscribe)
         when "Notification"
           Rails.logger.info "Received #{amz_message_type} notification."
         else
           Rails.logger.warning "Unknown notification type #{amz_message_type}."
      end
      render nothing: true
      ::SnsConnectionPool.release_sns_connection(sns)
    end
  end
end
