FROM php:7.4-cli

# Composer setup
RUN set -ex \
  && EXPECTED_SIGNATURE="$(curl -sL https://composer.github.io/installer.sig)" \
  && php -r 'copy("https://getcomposer.org/installer", "composer-setup.php");' \
  && ACTUAL_SIGNATURE="$(php -r 'echo hash_file("sha384", "composer-setup.php");')" \
  && test "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" \
  && php composer-setup.php --install-dir /usr/local/bin --filename composer \
  && rm composer-setup.php \
  && composer --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
