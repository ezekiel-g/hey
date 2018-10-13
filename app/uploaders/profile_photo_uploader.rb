class ProfilePhotoUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # if Rails.env.test?
  #   storage :file
  # else
  #   storage :fog
  # end
end
