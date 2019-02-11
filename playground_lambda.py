import json
import os

def handler(event, context):
  print(f'Hello From Inside of Lambda, the lambda variable is: {os.environ["lambda_variable"]}')
  # event['body']
  return {
    'statusCode': 200,
    'body': event['body']
  }