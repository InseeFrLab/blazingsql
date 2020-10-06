FROM blazingdb/blazingsql
RUN apt-get update -y && apt-get install -y wget
RUN userdel nobody
RUN groupadd --gid 99 nobody
RUN useradd nobody --uid 99 --home /home/nobody/ --create-home --groups nobody --gid nobody --shell /bin/bash
RUN chown -R nobody:nobody /blazingsql
ADD run_jupyter.sh /run_jupyter.sh
RUN chown nobody:nobody /run_jupyter.sh && chmod +x /run_jupyter.sh
USER nobody
