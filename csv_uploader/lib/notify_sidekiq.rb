require 'securerandom'
require 'json'

class NotifySidekiq
  attr_reader :redis

  def self.call
    new
  end

  def initialize(redis_url=ENV['REDIS_URL'])
    @redis = Redis.new(url: redis_url)
    call
  end

  def call
    redis.lpush("queue:default", JSON.dump(message))
  end

  private

  def message
    {
      "class" => 'ParserWorker',
      "queue" => 'default',
      "args" => [ENV['STORAGE_PATH']],
      'retry' => true,
      'jid' => SecureRandom.hex(12),
      'created_at' => Time.now.to_f,
      'enqueued_at' => Time.now.to_f
    }
  end
end
