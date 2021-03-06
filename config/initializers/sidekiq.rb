redis_domain = ENV['REDIS_PORT_6379_TCP_ADDR'] || 'localhost'
redis_port   = ENV['REDIS_PORT_6379_TCP_PORT'] || '6379'

if redis_domain && redis_port  
  redis_url = "redis://#{redis_domain}:#{redis_port}"

  Sidekiq.configure_server do |config|
    config.redis = {
      namespace: "sidekiq",
      url: redis_url
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      namespace: "sidekiq",
      url: redis_url
    }
  end
end  
