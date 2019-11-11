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
. bin/activate
pip install gunicorn
amazon-linux-extras install -y nginx1.12
gunicorn -u nginx -g nginx -b 0.0.0.0:8080 -D wsgi:app
cp flaskapp.conf /etc/nginx/conf.d
## comment /etc/nginx.conf server block
systemctl restart nginx.service
```
