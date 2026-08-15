#!/bin/bash

set -ueo pipefail
#set -x

# SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


echo "$SCRIPT_DIR"

for RCFILE in .bashrc .bash_logout .inputrc .project .screenrc .vimrc
do
	SRC_RC_FILE="${SCRIPT_DIR}/vonahsen${RCFILE}"
	DST_RC_FILE="${HOME}/${RCFILE}"
	if [[ -e "${SRC_RC_FILE}" ]]
	then
		echo "source $SRC_RC_FILE exists"
		# shellcheck disable=SC2143  # I'm grepping a single file, returning early with -q doesn't do much
		if [[ -e "${DST_RC_FILE}" && $(grep -q "${SRC_RC_FILE}" "${DST_RC_FILE}") ]]
		then
			echo "${DST_RC_FILE} alrady configured"
		else
			if [[ "${RCFILE}" == ".inputrc" ]]
			then
				echo "\$include $SRC_RC_FILE" >> "$DST_RC_FILE"
			else
				echo "source $SRC_RC_FILE" >> "$DST_RC_FILE"
			fi
		fi
	fi
done
