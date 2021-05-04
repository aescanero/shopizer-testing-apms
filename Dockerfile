FROM shopizerecomm/shopizer

RUN chgrp -R 0 /usr/local/tomcat && \
    chmod -R g=u /usr/local/tomcat

ENV JAVA_OPTS="-Xmx1024m"

CMD ["catalina.sh", "run"]

EXPOSE 8080
