#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')


hostname=$(hostname)
#$(hostname) is used to find hostname of local machine
hostip=$(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}')|awk '/inet /{gsub(/\/.*/,"");print $2}')
# storing IP of host machine as hostip. ifconfig command can be used to check ip of host.
LANhost=$(getent hosts $(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}'))|awk '/inet /{gsub(/\/.*/,"");print $2}' | awk '{print $2}')
# Storing LAN hostname in LANhost variable
PublicIP=$(curl -s icanhazip.com)
# storing public IP in PublicIP variable. one can figure out public ip by simply typing "what is my ip" in browser
PublicName=$(getent hosts $(curl -s icanhazip.com) | awk '{print $2}')
# storing Public name in PublicName variable
RouterIP=$(ip route show | grep -i 'default via' | awk '{print $3}')
# storing router IP in RouterIP variable. one can also figure out router IP with "ip route" command usually stored as default via.
RouterName=$(grep $RouterIP /etc/hosts | awk '{print $2}')
# getting router hostname from /etc/hosts file which has been previously added in file alongside router IP
cat << EOF
Hostname: $hostname
Private IP: $hostip
LAN Host: $LANhost
PublicIP: $PublicIP
PublicName: $PublicName
Router IP: $RouterIP
Router Hostname: $RouterName
EOF
