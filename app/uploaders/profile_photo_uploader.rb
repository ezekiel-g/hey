class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # if Rails.env.test?
  #   storage :file
  # else
  #   storage :fog
  # end
end
