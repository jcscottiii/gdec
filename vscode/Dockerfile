FROM base-gdec:latest
MAINTAINER James C. Scott III <jcscott.iii@gmail.com>

# Switch npm prefix to prevent using sudo.
RUN mkdir $HOME/.npm-global
ENV NPM_CONFIG_PREFIX $HOME/.npm-global
ENV PATH $HOME/.npm-global/bin:$PATH

# Change to root to install more dependencies
USER root
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

# Change back to non-root user
USER $USERNAME

# Install VSCode
RUN wget -O $HOME/VSCode.zip 'https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip'
RUN unzip $HOME/VSCode.zip -d $HOME/vscode/
RUN ln -s $HOME/vscode/VSCode-linux-x64/Code $HOME/bin/code
# Install vsce, the Visual Studio Extension Manager
RUN npm install -g vsce
# Install the vscode-go extension
RUN git clone https://github.com/Microsoft/vscode-go $HOME/.vscode/extensions/lukehoban.Go && cd $HOME/.vscode/extensions/lukehoban.Go && npm install && vsce package

# Move back to root for the su in entry.sh
USER root
