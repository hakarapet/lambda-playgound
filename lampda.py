def handler(event, context):
  print('Hello From Inside of Lambda')
  return {
    'statusCode': 200,
    'body': event['body']
  }