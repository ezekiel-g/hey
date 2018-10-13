require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.storage = :file
  config.cache_dir = "#{Rails.root}/app/assets/images"
end
