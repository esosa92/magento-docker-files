alias mgdeveloper='php bin/magento deploy:mode:set developer'
alias mgproduction='php bin/magento deploy:mode:set production'
alias mgcompile='php bin/magento setup:di:compile'
alias mgregenerateless='rm -rf pub/static/* && rm -rf var/view_preprocessed/* && rm -rf var/cache/* && bin/magento se:st:de -f -j 20 && bin/magento ca:fl'
alias mgurn='bin/magento dev:urn-catalog:generate .idea/misc.xml'
alias mgseup='bin/magento se:up'
alias mgcafl='bin/magento ca:fl'
alias mgreindex='bin/magento indexer:reindex'
alias mgdeploy='bin/magento se:st:deploy -f -j 20'
alias mgfullupgrade='mgseup && mgdeploy && mgreindex && mgcafl'
alias mgcreateuser="php bin/magento admin:user:create --admin-user='esosa92' --admin-password='1213c0mm3rc3' --admin-email='example@gmail.com' --admin-firstname='example' --admin-lastname='example'"
alias mgstartexport="php bin/magento queue:consumers:start exportProcessor"
alias mgdisableurlkey='bin/magento config:set admin/security/use_form_key 0'
alias mgmaxadminsessionlifetime='bin/magento config:set admin/security/session_lifetime 31536000'
alias mgcafllayout="mgcafl layout"
alias mgtemplatehintsenable="bin/magento dev:template-hints:enable"
alias mgtemplatehintsdisable="bin/magento dev:template-hints:disable"
alias mgstagingcronrun='php bin/magento cron:run --group="staging"'
alias mgfullcompile="mgseup && mgcompile && mgdeploy && mgcafl"
alias fullCompile="mgseup && mgcompile && mgdeploy && mgcafl"
alias debugoff='export XDEBUG_MODE=off'
alias debugon='export XDEBUG_MODE=debug'
alias mgdisable2fa='php bin/magento module:disable Magento_TwoFactorAuth'
alias phpunit='vendor/bin/phpunit --testdox -c dev/tests/unit/phpunit.xml.dist '
alias mgdisablepasswordresetretrylimit='bin/magento config:set customer/password/max_number_password_reset_requests 0 && bin/magento config:set customer/password/min_time_between_password_reset_requests 0'
