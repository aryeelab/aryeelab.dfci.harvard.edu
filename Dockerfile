FROM nginx:1.21.6

# VERSION is set to the Git SHORT_SHA commit id in cloudbuild.yaml
# (https://cloud.google.com/build/docs/configuring-builds/substitute-variable-values)
ARG VERSION=__specify_as_cloud_build_arg__

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

# Put the git commit id (specified as a GCP cloud build substituion) in the footer as a version number
RUN sed -i "s/__VERSION__/$VERSION/" /usr/share/nginx/html/index.html
