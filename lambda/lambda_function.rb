require 'slack-notifier'

def lambda_handler(*)
  message = random_message
  post_message(message)
end

def random_message
  'hoge'
end

def post_message(message)
  notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
  notifier.ping message
end

lambda_handler
