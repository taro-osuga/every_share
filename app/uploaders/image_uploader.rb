class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    #   For Rails 3.1+ asset pipeline compatibility:
      ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end

  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  version :thumbmid do
    process :resize_to_limit => [150, 150]
  end
end

