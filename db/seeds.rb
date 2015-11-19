# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'aws_service'
include AwsService

elt = AwsService::ElasticTranscoderService.new({:access_key_id => ENV['aws_access_key_id'],
                                                :secret_access_key => ENV['aws_secret_access_key']}, 
                                                ENV['aws_region'])
elt.sync_elt_presets
