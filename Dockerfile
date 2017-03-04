FROM jenkins
USER root
RUN apt-get --yes update && apt-get --yes install build-essential
ADD http://download.redis.io/releases/redis-3.0.7.tar.gz /tmp/redis-3.0.7.tar.gz
RUN tar xzvf /tmp/redis-3.0.7.tar.gz -C /tmp && cd /tmp/redis-3.0.7 && make
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/local/bin/lein
RUN chmod 0755 /usr/local/bin/lein
USER jenkins
