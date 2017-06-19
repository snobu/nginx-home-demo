# ----------------------------
# SSH Server support for Tux
# ----------------------------
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd
  
COPY sshd_config /etc/ssh/

EXPOSE 80 2222
