require 'slack-notifier'

def lambda_handler(*)
  message = 'Hi, Jun !! You are No.1 !!'
  post_message(message)
end

def post_message(message)
  notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
  notifier.ping message
end
