CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: Settings.amazon_s3.access_key_id,
    aws_secret_access_key: Settings.amazon_s3.secret_access_key
  }
  config.fog_directory = Settings.amazon_s3.bucket 
end