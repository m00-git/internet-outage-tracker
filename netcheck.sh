#!/bin/bash

netcheck=$( ping -c 1 google.com | grep icmp* | wc -l ) #
if [ $netcheck -eq 0 ] 
then 
    echo "Outage at";date

    gatewaycheck=$( ping -c 1 YOURDEFAULTGATEWAYIPHERE | grep icmp* | wc -l ) #checks default gateway
    if [ $gatewaycheck -eq 0 ] 
    then	    
	    echo "Gateway unreachable"
    fi
    if [ $gatewaycheck -eq 1 ]
    then
	    echo "Gateway reachable"
    fi

    localDNScheck=$( ping -c 1 YOURLOCALDNSIPHERE | grep icmp* | wc -l ) #checks local DNS
    if [ $localDNScheck -eq 0 ]
    then
	    echo "Local DNS unreachable"
    fi
    if [ $localDNScheck -eq 1 ]
    then
	    echo "Local DNS reachable"
    fi

    ISPDNScheck=$( ping -c 1 YOURISPDNSIPHERE | grep icmp* | wc -l ) #checks ISP DNS
    if [ $ISPDNScheck -eq 0 ]
    then
	    echo "ISP DNS unreachable"
    fi
    if [ $ISPDNScheck -eq 1 ]
    then
	    echo "Spectrum DNS reachable"
    fi

else
    echo "Network Up"
fi
