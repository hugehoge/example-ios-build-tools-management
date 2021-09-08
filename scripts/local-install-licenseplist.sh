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

NAME="LicensePlist"
VERSION="3.13.0"
ZIP_URL="https://github.com/mono0926/LicensePlist/releases/download/${VERSION}/portable_licenseplist.zip"
BIN_PATH="${INSTALL_PATH}/license-plist"

LICENSEPLIST_CMD="${BIN_PATH} --output-path ${TMPDIR} --force --suppress-opening-directory \
--cartfile-path /var/empty/Cartfile \
--mintfile-path /var/empty/Mintfile \
--pods-path /var/empty/Pods \
--package-path /var/empty/Package.swift \
--config-path /var/empty/license_plist.yml"
EXTRACT_VERSION_CMD="sed -n 3p ${TMPDIR}/com.mono0926.LicensePlist.latest_result.txt"
EXPECTED_VERSION_FMT="LicensePlist Version: ${VERSION}"

if [ "$(${LICENSEPLIST_CMD} >/dev/null 2>&1 && ${EXTRACT_VERSION_CMD} 2>/dev/null)" != "${EXPECTED_VERSION_FMT}" ]; then
  print_verbose "${NAME} ${VERSION} not installed. Download and installing..."

  curl -fsSL "${ZIP_URL}" | bsdtar xf - -C "${INSTALL_PATH}"
  chmod 755 "${BIN_PATH}"

  print_verbose "${NAME} ${VERSION} installed."
else
  print_verbose "${NAME} ${VERSION} already installed." 
fi

echo "${BIN_PATH}"
