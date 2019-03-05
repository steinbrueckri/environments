#!/bin/sh

source ~/.environments/functions.sh

setup_environment () {
  # get current location
  LOCATION=$(networksetup -getcurrentlocation | tr '[:upper:]' '[:lower:]')

  # get service for default route
  SERVICE_GUID=$(printf "open\nget State:/Network/Global/IPv4\nd.show" | scutil | awk '/PrimaryService/ { print $3}')

  # get service name for guid
  SERVICE_NAME=$(printf "open\nget Setup:/Network/Service/${SERVICE_GUID}\nd.show" | scutil | awk -F': ' '/UserDefinedName/ {print $2}')

  if [[ -d "$HOME/.environments/$LOCATION" ]]; then
    bot "Welcome to environment: ${GREEN}$LOCATION${NC}"

    task "Executing common.sh"
    include ~/.environments/common.sh

    for file in $(find ~/.environments/${LOCATION} -type f -name "*.sh"); do
      task "Executing $(basename ${file})"
      include ${file}
    done
  fi

  bot "All done."
}

setup_environment
