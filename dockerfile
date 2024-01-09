#Using ubuntu as the base OS
FROM ubuntu:latest

# Install OpenSSH server and other necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server 

# Set a password for the root user (Replace 'password' with your desired password)
RUN echo 'root:password' | chpasswd

# Create a user specifically used for connecting via SFTP protocol (Replace 'sftppassword' with your desired password for the sftp user)
RUN useradd -rm -d /home/sftpuser -s /bin/bash -u 1001 sftpuser && \
    ech 'sftpuser:sftppassword' | chpasswd