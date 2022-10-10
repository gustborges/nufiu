Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME'] || Rails.application.credentials.cloudinary[:cloud_name]
  config.api_key = ENV['CLOUDINARY_API_KEY'] || Rails.application.credentials.cloudinary[:api_key]
  config.api_secret = ENV['CLOUDINARY_API_SECRET'] || Rails.application.credentials.cloudinary[:api_secret]
  config.secure = true
end