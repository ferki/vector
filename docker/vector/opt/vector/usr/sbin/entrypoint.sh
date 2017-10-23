#!/usr/bin/env bash

set -x

for SERVER in $(openstack server list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack server delete $SERVER
done

for ROUTER in $(openstack router list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack router unset --external-gateway $ROUTER

  PORTS="$(openstack port list --router $ROUTER | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo)"

  for PORT in $PORTS; do
    openstack router remove port $ROUTER $PORT
  done

  openstack router delete $ROUTER
done

for NETWORK in $(openstack network list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack network delete $NETWORK
done

for SG in $(openstack security group list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack security group delete $SG
done

for KP in $(openstack keypair list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack keypair delete $KP
done

for FIP in $(openstack floating ip list | awk '{print $2;}' | grep -v ^ID | xargs -n1 echo); do
  openstack floating ip delete $FIP
done

