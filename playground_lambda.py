def handler(event, context):
  print('Hello From Inside of Lambda, bitch')
  # event['body']
  return {
    'statusCode': 200,
    'body': 'Hello From Inside of Lambda, bitch'
  }