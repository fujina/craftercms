#!/usr/bin/env bash

# Script to create the Solr core & Deployer target for a delivery environment.

if [ "$(whoami)" == "root" ]; then
	echo -e "\033[38;5;196m"
	echo -e "Crafter CMS cowardly refuses to run as root."
	echo -e "Running as root is dangerous and is not supported."
	echo -e "\033[0m"
	exit 1
fi

export DELIVERY_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DELIVERY_HOME/crafter-setenv.sh"

# Execute Groovy script
$DELIVERY_HOME/groovy/bin/groovy -Dgrape.root=$DELIVERY_HOME $DELIVERY_HOME/init-site.groovy "$@"
