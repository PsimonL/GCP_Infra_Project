import requests
import time

load_balancer_id = "34.8.66.70"
endpoint = "time"
url = f"http://{load_balancer_id}/{endpoint}"
number_of_requests = 30
interval_between_requests = 1

def send_requests():
    for i in range(1, number_of_requests + 1):
        try:
            response = requests.get(url)
            print(f"Request {i}: Status Code = {response.status_code}")
            if response.status_code == 403:
                print("Rate limit exceeded! Received 403 Forbidden.")
                break
        except requests.exceptions.RequestException as e:
            print(f"Request {i}: Failed with error: {e}")
        time.sleep(interval_between_requests)

if __name__ == "__main__":
    send_requests()

# If ec2-micro uses boot disk data will not be saved.
# Needed persisent disk to save actuall machine state.
# sudo yum install -y python3 python3-pip
