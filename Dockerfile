FROM blazingdb/blazingsql

RUN sudo apt-get -y update && \
    sudo apt-get -y install wget git jq bash-completion

RUN sudo wget "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -O /usr/local/bin/kubectl && \
    sudo chmod +x /usr/local/bin/kubectl
    
RUN sudo sh -c "kubectl completion bash >/etc/bash_completion.d/kubectl" 

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh

RUN sudo wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc && \
    sudo chmod +x /usr/local/bin/mc

#RUN userdel nobody
#RUN groupadd --gid 99 nobody
#RUN useradd nobody --uid 99 --home /home/nobody/ --create-home --groups nobody --gid nobody --shell /bin/bash
#RUN chown -R nobody:nobody /blazingsql
RUN pip install s3fs hvac boto3


ADD run_jupyter.sh /run_jupyter.sh
RUN chmod +x /run_jupyter.sh
#RUN chown nobody:nobody /run_jupyter.sh && chmod +x /run_jupyter.sh
#USER nobody
