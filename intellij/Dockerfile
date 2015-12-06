FROM jcscottiii/base-gui-gdec:latest
MAINTAINER James C. Scott III <jcscott.iii@gmail.com>

# Install additional libs
RUN apt-get install -y \
    openjdk-7-jre \
    openjdk-7-jdk \
    zenity
RUN apt-get clean

RUN wget -O $HOME/IdeaIC.tar.gz 'https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-15.0.1.tar.gz'
RUN mkdir $HOME/intellij && tar -xzf $HOME/IdeaIC.tar.gz -C $HOME/intellij/ --strip-components=1
RUN ln -s $HOME/intellij/bin/idea.sh $HOME/bin/idea.sh
