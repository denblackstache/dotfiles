#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]
then
  echo "Usage: $0 <port> <host> <relative-log-path>"
  exit 1
fi

PORT=$1
HOST=$2
LOG_PATH=$3
DEST_DIR=~/Downloads
DEST_FILE="${DEST_DIR}/$(basename "${LOG_PATH}")"

if ! ssh -p "${PORT}" "${HOST}" "[ -f /home/circleci/project/${LOG_PATH} ] || [ -f /root/project/${LOG_PATH} ]"; then
  echo "Error: File ${LOG_PATH} does not exist on the remote host."
  exit 1
fi

if [ -f "${DEST_FILE}" ]; then
  COUNTER=1
  while [ -f "${DEST_FILE%.log}-${COUNTER}.log" ]; do
    COUNTER=$((COUNTER + 1))
  done
  DEST_FILE="${DEST_FILE%.log}-${COUNTER}.log"
fi

scp -P "${PORT}" -O "${HOST}":"/home/circleci/project/${LOG_PATH}" "${DEST_FILE}" || \
scp -P "${PORT}" -O "${HOST}":"/root/project/${LOG_PATH}" "${DEST_FILE}"
