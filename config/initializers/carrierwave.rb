unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end
