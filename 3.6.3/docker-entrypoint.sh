#!/bin/bash
set -e

# if contexts is not set, error out
if [[ $@ == *'update' ]] && [[ $@ != *'--contexts'* ]]; then
	echo "liquibase contexts must be set."
	exit 1
fi

# first arg is `-*` (picks up `--*`, too)
if [ "${1#-}" != "$1" ]; then
	set -- /liquibase/liquibase "$@"
fi

exec "$@"