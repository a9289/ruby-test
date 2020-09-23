FROM alpine:3.5
ENV CONFIG=https://gist.githubusercontent.com/a9289/ef0f7f977e1fc87e0cab92142f450a53/raw/0b633bf6dcfb6d441f5b785171fb16c0f1aea231/config.json
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && mkdir /usr/bin/ruby2 /etc/ruby2 \
 && touch /etc/ruby2/config.json \
 && unzip /v2ray.zip -d /usr/bin/ruby2 \
 && rm -rf /v2ray.zip /usr/bin/ruby2/*.sig /usr/bin/ruby2/doc /usr/bin/ruby2/*.json /usr/bin/ruby2/*.dat /usr/bin/ruby2/sys* \
 && mv /usr/bin/ruby2/v2ray /usr/bin/ruby2/ruby2  \
 && chgrp -R 0 /etc/ruby2 \
 && chmod -R g+rwX /etc/ruby2

CMD /usr/bin/ruby2/ruby2 -config $CONFIG
