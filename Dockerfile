FROM heroku/heroku:16-build

WORKDIR /app

ENV STACK=heroku-16

RUN mkdir -p /app/builds /var/env /tmp/build-cache /tmp/herokiu-buildpack-tex

# Setup Sphinx test docs
COPY . /tmp/herokiu-buildpack-tex

# Install Sphinx buildpack
RUN /tmp/herokiu-buildpack-tex/bin/compile /app /var/env /tmp/build-cache

RUN echo "source /app/.profile.d/texlive.sh" > /root/.bashrc

CMD bash
