FROM python:3.11

RUN apt-get update -y
RUN apt-get install python3-pip -y
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade -r ./cfg/requirements.txt
RUN pip3 uninstall oscrypto -y
RUN pip3 install https://github.com/wbond/oscrypto/archive/d5f3437ed24257895ae1edd9e503cfb352e635a8.zip

RUN useradd -ms /bin/bash jupyter   
USER jupyter
WORKDIR /home/jupyter 

ENTRYPOINT ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"] 
EXPOSE 8888