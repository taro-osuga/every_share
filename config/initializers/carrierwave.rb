unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    
  end
end
