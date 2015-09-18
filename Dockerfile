FROM cloudfoundry/cflinuxfs2

RUN echo 'Hello, World' > README.txt

CMD ruby -run -ehttpd . -p$PORT
