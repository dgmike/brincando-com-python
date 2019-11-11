# Dependencies

- python3
- pip3
- virtualenv
- gunicorn
- make

# Install dependencies

```sh
yum update
yum install -y make python3 pip3
pip3 install virtualenv
virtualenv .
. bin/activate
make install
```

# Running application

## Develop mode

```sh
. bin/activate
make run
```

## Production mode

```sh
yum update -y
yum install -y make python3 pip3
amazon-linux-extras install -y nginx1.12
pip3 install -U virtualenv gunicorn
/usr/local/bin/virtualenv /app
cd /app
# aws s3 cp [address] ./app.tar
tar -xvf app.tar
. bin/activate
cp nginx/conf.d/flaskapp.conf /etc/nginx/conf.d
cp nginx/nginx.conf /etc/nginx
gunicorn -u nginx -g nginx -b 0.0.0.0:8080 -D wsgi:app
systemctl restart nginx.service
```
