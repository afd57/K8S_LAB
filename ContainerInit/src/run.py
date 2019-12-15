import time
from datetime import datetime


while(True):
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    print(f"Working server {current_time}")
    time.sleep(2.4)