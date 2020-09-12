#!/bin/sh
# ruby2 new configuration
cat <<-EOF > /etc/ruby2/config.json
$CONFIG_JSON
EOF
# Run ruby2
/usr/bin/ruby2/ruby2 -config=/etc/ruby2/config.json
