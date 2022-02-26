FROM nginx:1.21.6

COPY nginx.conf  /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

COPY _site/ /usr/share/nginx/html/

# Generate a self-signed SSL certificate in /ssl for testing
# This can be overmounted with a real certificate when starting the container
RUN mkdir /ssl && \
        openssl req -subj '/O=Aryee Lab/C=US/CN=aryeelab.dfci.harvard.edu' \
        -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 \
        -keyout /ssl/aryeelab_dfci_harvard_edu.key \
        -out /ssl/aryeelab_dfci_harvard_edu.cer

