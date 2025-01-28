import boto3
from botocore.config import Config

# Konfigurasi akses ke Neva Object Storage
s3 = boto3.client(
    's3',
    aws_access_key_id='GWAWLX8LXVP86D3QIEND',
    aws_secret_access_key='LW6doJ30Cemim5upi8qj6TpJ5piAtuJ851b8l8xb',
    endpoint_url='https://s3.nevaobjects.id',
    config=Config(signature_version='s3v4'),
)

# Konfigurasi CORS
cors_configuration = {
    'CORSRules': [
        {
            'AllowedHeaders': ['*'],
            'AllowedMethods': ['GET', 'PUT', 'POST', 'HEAD'],
            'AllowedOrigins': ['*'],
            'ExposeHeaders': []
        }
    ]
}

# Terapkan CORS ke bucket
bucket_name = 'app-membership-01'

s3.put_bucket_cors(
    Bucket=bucket_name,
    CORSConfiguration=cors_configuration
)

print(f"CORS berhasil diterapkan untuk bucket '{bucket_name}'!")
