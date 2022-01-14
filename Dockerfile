FROM alpine
RUN apk add --no-cache \
      openjdk11 \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      npm
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
#ADD pagedjs-files /pagedjs-files
#RUN cp -R /pagedjs-files/ /usr/local/lib/node_modules/
RUN ln -s ../lib/node_modules/pagedjs-cli/bin/paged pagedjs-cli
RUN mv pagedjs-cli /usr/local/bin
ECHO ECHO bravo
