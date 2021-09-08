#!/usr/bin/env bash

# Function

function print_verbose() {
    if [ ${S_FLAG} -ne 1 ]; then
        echo "$1"
    fi
}

# Usage Text

USAGE=$(cat <<EOF
Usage:
    $(basename ${0}) [<options>] [install path]

Options:
    -h  help text
    -s  silent mode
EOF
)

# Arguments parse

S_FLAG=0
while getopts :hs OPT
do
    case $OPT in
        h)  echo "${USAGE}"
            exit 0
            ;;
        s)  S_FLAG=1
            ;;
        \?) echo "${USAGE}" 1>&2
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

if [ $# != 1 ]; then
    echo "${USAGE}" 1>&2
    exit 1
fi
INSTALL_PATH=$1

# Install process

mkdir -p "${INSTALL_PATH}"

NAME="SwiftLint"
VERSION="0.43.1"
ZIP_URL="https://github.com/realm/SwiftLint/releases/download/${VERSION}/portable_swiftlint.zip"
BIN_PATH="${INSTALL_PATH}/swiftlint"

VERSION_CMD="${BIN_PATH} version"
EXPECTED_VERSION_FMT="${VERSION}"

if [ "$(${VERSION_CMD} 2>/dev/null)" != "${EXPECTED_VERSION_FMT}" ]; then
  print_verbose "${NAME} ${VERSION} not installed. Download and installing..."

  curl -fsSL "${ZIP_URL}" | bsdtar xf - -C "${INSTALL_PATH}"
  chmod 755 "${BIN_PATH}"

  print_verbose "${NAME} ${VERSION} installed."
else
  print_verbose "${NAME} ${VERSION} already installed." 
fi

echo "${BIN_PATH}"
