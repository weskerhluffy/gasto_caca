require 'resque_scheduler'
Dir[File.join(Rails.root, 'app', 'jobs', '*.rb')].each { |file| require file }
config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
if (config.blank?)
  config = YAML::load(File.open("#{File.dirname(__FILE__)}/../../config/redis.yml"))["development"]
end
Resque.redis = Redis.new(:host => config['host'], :port => config['port'])
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")