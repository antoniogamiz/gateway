# gateway

# Nginx setup

```
apt install nginx
rm /etc/nginx/sites-enabled/default
vim /etc/nginx/sites-enabled/manga-cradle.com
```

Add this content to the file:

```
server {
    listen 80;
    server_name manga-cradle.com;

    location /health {
            access_log off;
            return 200 "healthy\n";
    }

    location / {
            proxy_pass http://localhost:8080/;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_cache_bypass $http_upgrade;
    }
  }
```
