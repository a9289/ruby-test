#!/bin/sh
# ruby2 new configuration
base64 > /etc/ruby2/config << EOF
{
  "inbounds": [
  {
    "port": $PORT,
    "listen":"127.0.0.1",
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
          "alterId": 64       
        }
      ]
    },
    "streamSettings": {
      "network": "ws"
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# Run ruby2
cat /etc/ruby2/config | base64 -d > /etc/ruby2/config.json
/usr/bin/ruby2/ruby2 -config=/etc/ruby2/config.json
