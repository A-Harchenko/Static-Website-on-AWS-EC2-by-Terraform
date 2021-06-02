#!/bin/bash
sudo apt install apache2 -y
cd /var/www/html
sudo rm index.html
sudo touch index.html
cat << EOF | sudo tee -a index.html
<html>
<head>
<title>Finish</title>
<style>
body {
background: #F2F2F2;
max-width: 900px;
margin: 10px auto;
padding: 30px;
}
h1{
color: #4C4C4C;
padding-bottom: 20px;
margin-bottom: 20px;
border-bottom: 2px solid #BEBEBE;
}
p{
font:italic;
}
</style>
</head>
<body>
<h1>It was an interesting task</h1>
</body>
</html>
EOF
sudo systemctl start apache2 
sudo systemctl enable apache2 
