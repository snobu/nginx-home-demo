FROM nginx

COPY sshd_config /etc/ssh/
COPY nginx.conf /etc/nginx/

# SSH Server support for Tux
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd

RUN mkdir -p /run/sshd

CMD service ssh start
CMD nginx -g 'daemon off;'

EXPOSE 80 2222
