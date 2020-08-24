FROM fpco/stack-build:lts-16.10

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y libicu-dev libtinfo-dev libgmp-dev gnupg1 ca-certificates

# Options for setup script
ARG INSTALL_ZSH="true"
ARG UPGRADE_PACKAGES="false"
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ADD https://raw.githubusercontent.com/microsoft/vscode-dev-containers/master/script-library/common-debian.sh /tmp/library-scripts/

RUN bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

USER vscode
WORKDIR /home/vscode
RUN mkdir -p /home/vscode/.local/bin

# Install haskell ide engine
RUN git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules \
    && cd haskell-ide-engine \
    && stack ./install.hs hie-8.8.3 \
    && stack ./install.hs data


# Set the default shell to bash rather than sh
ENV SHELL /bin/bash