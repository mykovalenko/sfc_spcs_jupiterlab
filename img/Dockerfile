FROM python:3.10

WORKDIR /opt/spcs
COPY ./main.sh /opt/spcs/
COPY ./requirements.txt /opt/spcs/cfg/

RUN apt-get update -y
RUN apt-get install curl python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade -r ./cfg/requirements.txt
RUN pip3 uninstall oscrypto -y
RUN pip3 install https://github.com/wbond/oscrypto/archive/d5f3437ed24257895ae1edd9e503cfb352e635a8.zip

RUN echo "https://packages.microsoft.com/config/debian/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1)/packages-microsoft-prod.deb"

RUN if ! [[ "11 12" == *"$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1)"* ]]; then echo "Debian $(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1) is not currently supported."; exit; fi

RUN curl -sSL -O https://packages.microsoft.com/config/debian/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1)/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update

RUN env ACCEPT_EULA=Y apt-get install -y msodbcsql18
RUN env ACCEPT_EULA=Y apt-get install -y mssql-tools18
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
RUN apt-get install unixodbc-dev libgssapi-krb5-2 -y

RUN chmod 744 /opt/spcs/main.sh
RUN useradd -ms /bin/bash jupyter
USER jupyter

ENTRYPOINT [ "/opt/spcs/main.sh" ]
EXPOSE 8888

