sudo apt install openssl -y
 openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem
  sudo mkdir -p /etc/ssl/mycerts
    sudo mv key.pem /etc/ssl/mycerts/
    sudo mv cert.pem /etc/ssl/mycerts/
    sudo chmod 600 /etc/ssl/mycerts/key.pem
    sudo chmod 644 /etc/ssl/mycerts/cert.pem
