import requests

def detect_object(image_path):
    api_url = 'https://api.api-ninjas.com/v1/objectdetection'
    image_file_descriptor = open(image_path, 'rb')
    files = {'image': image_file_descriptor}
    r = requests.post(api_url, files=files,headers={ "X-Api-Key": "A5YaK1WdiD17DoY/DO0X7g==tqyS8IjQjqsVDGGZ"})
    print(r.json())