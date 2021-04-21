import json
import datetime

from datetime import timezone

# Set UTC Timestamp
dt = datetime.datetime.now(timezone.utc)

def lambda_handler(event, context):
    print("Received event: " + json.dumps(event, indent=2))
    print(f'Hello World Lambda: {dt.timestamp()}')