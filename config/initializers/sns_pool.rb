aws_access_key_id = ENV["aws_access_key_id"]
aws_secret_access_key = ENV["aws_secret_access_key"]
aws_region = ENV["aws_region"]

::SnsTopicArn = ENV["sns_topic_arn"]
::SnsAuthOnUnsubscribe = ENV["sns_auth_on_unsubscribe"]
sns_connection_pool_size= ENV["sns_connection_pool_size"]
sns_max_pending_notifications= ENV["sns_max_pending_notifications"]

require 'modules/aws_service.rb'
include AwsService
::SnsConnectionPool = AwsService::SnsConnectionPool.new({:access_key_id => aws_access_key_id, 
                                              :secret_access_key => aws_secret_access_key}, 
                                              aws_region, sns_connection_pool_size.to_i, sns_max_pending_notifications.to_i)
