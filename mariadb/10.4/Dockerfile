FROM mariadb:10.4
RUN apt update -y
    #&& apt install --fix-missing -y pv \
#    && apt install --fix-missing -y make \
#    && apt install --fix-missing -y fzf \
#    && apt install --fix-missing -y iputils-ping
ARG UID

COPY --from=common:latest /add_app_user.sh .
RUN /bin/bash add_app_user.sh
RUN rm add_app_user.sh

COPY --from=common:latest /shell-tools /shell-tools
RUN chown -R appuser:appuser /shell-tools

RUN mkdir /dbscripts
RUN chown -R appuser:appuser /dbscripts
