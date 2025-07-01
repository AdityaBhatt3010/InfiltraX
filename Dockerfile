# Base image with essential tools
FROM kalilinux/kali-rolling

LABEL maintainer="Aditya Bhatt"
LABEL description="Containerized Ethical Intrusions VAPT Toolkit"

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install tools
RUN apt-get update && apt-get install -y \
    nmap \
    whois \
    dnsutils \
    smbclient \
    metasploit-framework \
    python3 \
    python3-pip \
    git \
    curl \
    net-tools \
    openvas \
    tcpdump \
    wireshark \
    burpsuite \
    zaproxy \
    && apt-get clean

# Set work directory
WORKDIR /opt/ethical-intrusions

# Copy project files
COPY . .

# Install Python dependencies if any
RUN pip3 install -r requirements.txt || true

# Entrypoint (can be changed)
CMD ["/bin/bash"]
