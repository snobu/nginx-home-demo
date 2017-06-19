FROM adcaline/nginx:home

COPY sshd_config /etc/ssh/

# SSH Server support for Tux
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd

RUN mkdir -p /run/sshd

EXPOSE 80 2222

CMD ["/usr/sbin/sshd", "-D"]
