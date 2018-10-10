#!/bin/bash 
RC_URL="http://192.168.1.116"
OUTLET_NUMBER=0
CT_SENSOR=0 
CURRENT_THRESHOLD=7
OUTLET_CURRENT=$(curl -s ${RC_URL}/api/sensor/status/${CT_SENSOR})
if (( $( echo "$OUTLET_CURRENT > ${CURRENT_THRESHOLD}" | bc -l ) )); then
	echo "Current of outlet ${OUTLET_NUMBER} is over threshhold! Shutting off outlet ${OUTLET_NUMBER}." 
	curl -s ${RC_URL}/api/relay/off/${OUTLET_NUMBER}
fi

