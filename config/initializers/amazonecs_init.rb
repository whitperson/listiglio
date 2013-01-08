Amazon::Ecs.configure do |options|
  options[:associate_tag] = 'whitpersoncom-20'
  options[:AWS_access_key_id] = ENV['AWSKEY']
  options[:AWS_secret_key] = ENV['AWSSEC']
end