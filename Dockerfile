FROM debian:jessie

# install prereqs
RUN apt-get update && \
    apt-get -qy --no-install-recommends install \
        openjdk-7-jre-headless \
        cpio \
        curl

WORKDIR /src
ENV CRASHPLAN_VERSION="4.2.0" \
    CRASHPLAN_ARCHIVE_DIR="/srv/crashplan/backups" \
    CRASHPLAN_BACKUP_DIR="/mnt/targets"

# add install script
COPY crashplan-install.sh /src/

# download and unpack crashplan
RUN curl -SL http://download.code42.com/installs/linux/install/CrashPlan/CrashPlan_${CRASHPLAN_VERSION}_Linux.tgz \
    | tar -xz \
    && sh crashplan-install.sh

# add scripts
COPY start.sh /

EXPOSE 4243 4242

CMD ["sh", "/start.sh"]
