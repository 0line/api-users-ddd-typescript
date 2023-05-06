FROM node:18-slim

# Create app directory
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
# Default powerline10k theme, no plugins installed
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" --\
  -p git -p ssh-agent -p 'history-substring-search' \
  -p node -p npm \
  -t refined

COPY package.json package-lock.json ./
RUN npm install
EXPOSE ${port}
