if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],       # required
      :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],       # required
    }
    config.fog_directory  = 'dev-cloudgephi'                     # required
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end