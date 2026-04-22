FROM debian:13-slim
RUN useradd -ms /bin/bash alderson
RUN apt update && apt install -y wget netcat-traditional curl libicu76 && rm -rf /var/lib/apt/lists/*
ADD https://dot.net/v1/dotnet-install.sh /home/alderson/dotnet-install.sh
RUN chmod 755 /home/alderson/dotnet-install.sh
USER alderson:alderson
RUN bash ~/dotnet-install.sh -c 6.0 && bash ~/dotnet-install.sh -c 7.0
USER root:root
RUN rm /home/alderson/dotnet-install.sh
USER alderson:alderson
