require 'resque_scheduler'
Dir[File.join(Rails.root, 'app', 'jobs', '*.rb')].each { |file| require file }
config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
Resque.redis = Redis.new(:host => config['host'], :port => config['port'])
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")