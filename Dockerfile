FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Cập nhật và cài đặt các gói cần thiết, bao gồm python3-venv
RUN apt update -y && apt install -y python3-pip python3-dev python3-venv build-essential

# Tạo thư mục cho app
ADD . /flask_app
WORKDIR /flask_app

# Tạo môi trường ảo và cài đặt dependencies
RUN python3 -m venv venv
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Khởi động ứng dụng Flask
CMD ["./venv/bin/python", "flask_docker.py"]

