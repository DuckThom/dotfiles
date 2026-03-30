#!/bin/sh

BW_VERSION="2026.2.0"
BWS_VERSION="2.0.0"

BW_INSTALLED_VERSION="$(type bw >/dev/null 2>&1 && bw -v)"
BWS_INSTALLED_VERSION="$(type bws >/dev/null 2>&1 && bws -V)"

MACHINE="$(uname -m)"

case "$(uname -s)" in
Darwin)
    BW_SYSTEM="macos-arm64"
    BWS_SYSTEM="apple-darwin"
    ;;
Linux)
    BW_SYSTEM="linux"
    BWS_SYSTEM="unknown-linux-gnu"
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac

if [ "${BW_VERSION}" != "${BW_INSTALLED_VERSION}" ]
then
    echo "Downloading Bitwarden CLI v${BW_VERSION}"
    wget -O/tmp/chezmoi_bw.zip -q https://github.com/bitwarden/clients/releases/download/cli-v${BW_VERSION}/bw-${BW_SYSTEM}-${BW_VERSION}.zip
    mkdir -p ~/.local/bin
    unzip /tmp/chezmoi_bw.zip -d ~/.local/bin
    chmod +x ~/.local/bin/bw
    rm -f /tmp/chezmoi_bw.zip
fi

if [ "bws ${BWS_VERSION}" != "${BWS_INSTALLED_VERSION}" ]
then
    echo "Downloading Bitwarden Secrets CLI v${BWS_VERSION}"
    wget -O/tmp/chezmoi_bws.zip -q https://github.com/bitwarden/sdk-sm/releases/download/bws-v${BWS_VERSION}/bws-${MACHINE}-${BWS_SYSTEM}-${BWS_VERSION}.zip
    mkdir -p ~/.local/bin
    unzip /tmp/chezmoi_bws.zip -d ~/.local/bin
    chmod +x ~/.local/bin/bws
    rm -f /tmp/chezmoi_bws.zip
fi
