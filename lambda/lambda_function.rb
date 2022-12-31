def lambda_handler(*)
  message = random_message
  post_message(message)
end

def random_message
  'hoge'
end

def post_message(message)
  p message
end

lambda_handler
