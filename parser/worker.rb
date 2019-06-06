require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

class ParserWorker
  include Sidekiq::Worker

  def perform(file_path)
  end
end
