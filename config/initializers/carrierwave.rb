CarrierWave.configure do |config|
  
  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => '',            # required
    :aws_secret_access_key  => '',     # required
    :region                 => 'us-west-2'                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'elasticbeanstalk-us-west-2-671946291905'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end
  
  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

end
