FROM ubuntu:14.04
MAINTAINER James C. Scott III <jcscott.iii@gmail.com>

# Update all the package references available for download
RUN apt-get update

# Setup for non-interactive install
ENV DEBIAN_FRONTEND noninteractive

# Install tools
RUN apt-get install -y \
    curl \
    git \
    make \
    npm \
    zip \
    wget

# Make sure to download newer version of node than what is the default in apt-get
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Some apps want 'node', this just symlinks nodejs to node
#RUN sudo ln -s "$(which nodejs)" /usr/bin/node

# Download GVM
#RUN curl -o /home/root/gvm-installer -SL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer
#	&& chmod a+x ~/gvm-installer \
#	&& ~/gvm-installer \
#	&& /bin/bash -c "source ~/.gvm/scripts/gvm" \
#	&& cat ~/.gvm/scripts/gvm \
#	&& /usr/local/bin/gvm install go1.4 
	#&& gvm use go1.4 \
	#&& export GOROOT_BOOTSTRAP=$GOROOT \
	#&& gvm install go1.5 \
	#&& gvm use go1.5

#RUN /bin/bash < ~/gvm-installer 

# Install Go 1.5
RUN wget https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz
RUN sudo tar -C /usr/local -xzf go1.5.linux-amd64.tar.gz
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go

# In order to install the latest Go, have to install Go 1.4
# RUN gvm install go1.4 && gvm use go1.4 && gvm install go1.5

#RUN useradd gopher
#USER gopher


# Download and install visual studio code
RUN mkdir -p /root/vscode
#RUN git clone https://github.com/microsoft/vscode /root/vscode

#WORKDIR /root/vscode

# Install VSCode
RUN wget -O /root/VSCode.zip 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip' # /root/VSCode.zip
#RUN curl -O -J -L http://go.microsoft.com/fwlink/?LinkID=534108
#RUN sudo npm install -g mocha gulp
##CMD cd vscode && npm install -g mocha gulp
#RUN sudo ./scripts/npm.sh install --arch=x64

#RUN apt-get install -y \
#    libgtk2.0-0 \
#    libgconf-2-4 \
#    libasound2 \
#    libxtst6 \
#    libnss3

#RUN ./scripts/code.sh
RUN unzip /root/VSCode.zip -d /root/vscode/
RUN sudo ln -s /root/vscode/VSCode-linux-x64/Code /usr/local/bin/code

# Set the gopath
RUN mkdir -p /root/goproject/src
ENV GOPATH /root/goproject
# Install all the tools needed for the vscode-go extension
RUN go get -u -v github.com/nsf/gocode github.com/rogpeppe/godef github.com/golang/lint/golint github.com/lukehoban/go-find-references sourcegraph.com/sqs/goreturns golang.org/x/tools/cmd/gorename

# Install delve, the Go debugger
ENV GO15VENDOREXPERIMENT 1
RUN git clone https://github.com/derekparker/delve.git $GOPATH/src/github.com/derekparker/delve
RUN cd $GOPATH/src/github.com/derekparker/delve && make install

RUN npm install -g vsce
# Install the vscode-go extension
RUN git clone https://github.com/Microsoft/vscode-go /root/.vscode/extensions/lukehoban.Go && cd /root/.vscode/extensions/lukehoban.Go && npm install && vsce package

ADD settings.json /root/.config/Code/User/settings.json
WORKDIR $GOPATH
#RUN sudo code .
