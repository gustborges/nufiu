$redis = Redis.new

url = ENV['REDISCLOUD_URL'] || Rails.application.credentials.redis[:cloud_url]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(url: url)
end
