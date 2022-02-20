FROM nginx:1.21.6

COPY nginx.conf  /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

COPY _site/ /usr/share/nginx/html/

# Generate a self-signed SSL certificate in /ssl for testing
# This can be overmounted with a real certificate when starting the container
RUN mkdir /ssl && \
        openssl req -subj '/O=Aryee Lab/C=US/CN=aryee.mgh.harvard.edu' \
        -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 \
        -keyout /ssl/aryee.mgh.harvard.edu.key \
        -out /ssl/aryee_mgh_harvard_edu_cert.cer

# RUN sed -i \
#         -e 's/^SSLCertificateKeyFile.*/SSLCertificateKeyFile \/ssl\/aryee.mgh.harvard.edu.key/' \
#         -e 's/^SSLCertificateFile.*/SSLCertificateFile \/ssl\/aryee_mgh_harvard_edu_cert.cer/' \        
#         -e 's/^#SSLCertificateChainFile.*/SSLCertificateChainFile \/ssl\/aryee_mgh_harvard_edu_interm.cer/' \        
#         conf/extra/httpd-ssl.conf

