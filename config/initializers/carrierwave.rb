# CarrierWave.configure do |config|
#     config.fog_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: ENV[AWS_ACCESS_KEY_ID],
#         aws_secret_access_key: ENV[AWS_SECRET_ACCESS_KEY],

#     }
#     config.storage = :file
#     config.permissions = 0666
#     config.cache_dir = "#{Rails.root}/tmp/"
#     config.file_directory = ENV['FOG_DIRECTORY']
#     config.file_attributes = {'Cache-Control' => "max-age=#{365.day.to_i}" } #optional
# end