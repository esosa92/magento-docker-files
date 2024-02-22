FROM mariadb:10.7
RUN apt update  \
    && apt install -y pv \
    && apt install -y make \
    && apt install -y fzf \
    && apt install -y iputils-ping
ARG UID

COPY --from=common:latest /add_app_user.sh .
RUN /bin/bash add_app_user.sh
RUN rm add_app_user.sh

COPY --from=common:latest /shell-tools /shell-tools
RUN chown -R appuser:appuser /shell-tools

RUN mkdir /dbscripts
RUN chown -R appuser:appuser /dbscripts
