FROM httpd:2.4

RUN apt-get update && \
    apt-get install openssl

COPY _site/ /usr/local/apache2/htdocs/

RUN sed -i \
        -e 's/^Listen 80/Listen ${PORT}/' \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf

# Generate a self-signed SSL certificate in /ssl for testing
# This can be overmounted with a real certificate when starting the container
RUN mkdir /ssl && \
        openssl req -subj '/O=Aryee Lab/C=US/CN=aryee.mgh.harvard.edu' \
        -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 \
        -keyout /ssl/aryee.mgh.harvard.edu.key \
        -out /ssl/aryee_mgh_harvard_edu_cert.cer && \
        cp /ssl/aryee_mgh_harvard_edu_cert.cer /ssl/aryee_mgh_harvard_edu_interm.cer

RUN sed -i \
        -e 's/^SSLCertificateKeyFile.*/SSLCertificateKeyFile \/ssl\/aryee.mgh.harvard.edu.key/' \
        -e 's/^SSLCertificateFile.*/SSLCertificateFile \/ssl\/aryee_mgh_harvard_edu_cert.cer/' \        
        -e 's/^#SSLCertificateChainFile.*/SSLCertificateChainFile \/ssl\/aryee_mgh_harvard_edu_interm.cer/' \        
        conf/extra/httpd-ssl.conf

