FROM clue/ttrss
MAINTAINER Igor Avdeev

ADD wait-for-mysql.sh /wait-for-mysql.sh
RUN chmod +x /wait-for-mysql.sh

CMD /wait-for-mysql.sh && php /configure-db.php && supervisord -c /etc/supervisor/conf.d/supervisord.conf
