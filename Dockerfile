FROM ubuntu:14.04
MAINTAINER James C. Scott III <jcscott.iii@gmail.com>

# Create non-root user
ENV USERNAME gopher
ENV HOME /home/$USERNAME
RUN groupadd -r $USERNAME -g 757 && \
     useradd -u 757 --create-home --home-dir $HOME $USERNAME -g $USERNAME && \
     chown -R $USERNAME:$USERNAME $HOME

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
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y \
    nodejs

# Install libs for GUI
RUN apt-get install -y \
    libgtk2.0-0 \
    libgconf-2-4 \
    libasound2 \
    libxtst6 \
    libnss3

# Switch to non-root user
USER $USERNAME
RUN mkdir $HOME/bin
ENV PATH $HOME/bin:$PATH

# Switch npm prefix to prevent using sudo.
RUN mkdir $HOME/.npm-global
ENV NPM_CONFIG_PREFIX $HOME/.npm-global
ENV PATH $HOME/.npm-global/bin:$PATH

# Download and install visual studio code
RUN mkdir -p $HOME/vscode

# Install VSCode
RUN wget -O $HOME/VSCode.zip 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip'
RUN unzip $HOME/VSCode.zip -d $HOME/vscode/
RUN ln -s $HOME/vscode/VSCode-linux-x64/Code $HOME/bin/code

# Go-specific instructions.
# Install Go 1.5
RUN wget https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz -O $HOME/go.tar.gz
RUN mkdir $HOME/go && tar -C $HOME -xzf $HOME/go.tar.gz && rm $HOME/go.tar.gz
RUN ln -s $HOME/go/bin/go $HOME/bin/go

# Set the gopath
RUN mkdir -p $HOME/project/src
ENV GOPATH $HOME/project
ENV GOROOT $HOME/go

# Install all the tools needed for the vscode-go extension
RUN go get -u -v github.com/nsf/gocode github.com/rogpeppe/godef github.com/golang/lint/golint github.com/lukehoban/go-find-references sourcegraph.com/sqs/goreturns golang.org/x/tools/cmd/gorename

# Install delve, the Go debugger
ENV GO15VENDOREXPERIMENT 1
RUN git clone https://github.com/derekparker/delve.git $GOPATH/src/github.com/derekparker/delve
RUN cd $GOPATH/src/github.com/derekparker/delve && make install

# Install vsce, the Visual Studio Extension Manager
RUN npm install -g vsce
# Install the vscode-go extension
RUN git clone https://github.com/Microsoft/vscode-go $HOME/.vscode/extensions/lukehoban.Go && cd $HOME/.vscode/extensions/lukehoban.Go && npm install && vsce package

# Preserve the PATH because when we run `su $USERNAME`, PATH would have been reset.
# Part of workaround discussed in entry.sh
RUN echo "export PATH=$PATH" >> $HOME/.bashrc

# Add settings.json file that contains settings for the go extension
RUN mkdir -p $HOME/.config/Code/User/
ADD settings.json $HOME/.config/Code/User/settings.json
USER root
RUN chown -R $USERNAME:$USERNAME $HOME/.config/Code/User/settings.json

# Set the workspace
WORKDIR $GOPATH

# Add the entrypoint script
ADD entry.sh $HOME/bin/entry.sh
RUN chmod +x $HOME/bin/entry.sh

ENTRYPOINT "$HOME/bin/entry.sh"
