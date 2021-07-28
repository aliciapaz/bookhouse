uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://localhost:6379/"))
$redis = Redis.new(driver: :hiredis, url: uri)
