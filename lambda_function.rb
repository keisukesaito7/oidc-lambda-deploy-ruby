require 'slack-notifier'
require 'aws-sdk-kms'
require 'base64'

ENCRYPTED_SLACK_WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']
DECRYPTED_SLACK_WEBHOOK_URL = Aws::KMS::Client.new
    .decrypt({
        ciphertext_blob: Base64.decode64(ENCRYPTED_SLACK_WEBHOOK_URL),
        encryption_context: {'LambdaFunctionName' => ENV['AWS_LAMBDA_FUNCTION_NAME']},
    })
    .plaintext

def lambda_handler(*)
  message = 'Hi, Jun !! You are No.1 !!'
  post_message(message)
end

def post_message(message)
  notifier = Slack::Notifier.new DECRYPTED_SLACK_WEBHOOK_URL
  notifier.ping message
end
