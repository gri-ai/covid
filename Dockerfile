FROM ubuntu:16.04


ENV GOOGLE_APPLICATION_CREDENTIALS '/code/MyLabProject-acd7f2b7f7a0.json'

#RUN mkdir /code
WORKDIR /code


#COPY requirements.txt /code/
#COPY MyLabProject-acd7f2b7f7a0.json /code/
##COPY key.json /code/

COPY . /code/
COPY ./chatbot/chatbot/httpd.conf /etc/apache2/conf-enabled/httpd.conf

RUN chmod +x ./chatbot/manage.py

RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install apache2
RUN apt-get -y install postgresql
RUN apt-get -y install libapache2-mod-wsgi-py3
RUN if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi
RUN python3 get-pip.py
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN a2enmod cgi
#RUN a2enconf wsgi.conf

#RUN chmod +x ./httpd-foreground
EXPOSE 8092
# CMD ["./httpd-foreground"]
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

#RUN apt-get -y install wget
#RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
#RUN chmod +x cloud_sql_proxy
#CMD ["./cloud_sql_proxy", "-instances='mylabproject:us-central1:spbot'=tcp:5444", "-credential_file=/code/key.json"]
#ENTRYPOINT service apache2 start
#ENTRYPOINT service apache2 start ; ./cloud_sql_proxy -instances='mylabproject:us-central1:spbot'=tcp:5444 -credential_file=/code/key.json
#ENTRYPOINT ["service", "apache2", "start"]
#ENTRYPOINT ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
#CMD ["export", "GOOGLE_APPLICATION_CREDENTIALS='/code/MyLabProject-acd7f2b7f7a0.json'"]
#?CMD ["service", "apache2", "start", "&&", "tail", "-F", "/var/log/apache2/error.log"]

