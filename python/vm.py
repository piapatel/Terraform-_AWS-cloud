import boto3

client = boto3.client('ec2', region_name='us-east-1')
response = client.enable_ebs_encryption_by_default()

