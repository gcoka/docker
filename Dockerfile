# ベースイメージ
FROM node:8.8.1-alpine

# Pythonインストール
# from frolvlad/alpine-python3
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# AWS CLIインストール
RUN pip3 install awscli

# 環境変数の設定
ENV TZ=Asia/Tokyo HOME=/home/node NODE_ENV=development

# 一般ユーザに切り替え
USER node
WORKDIR $HOME

CMD ["/bin/sh"]
