#!/bin/bash

function battery_meter() {

    if [ "$(which acpi)" ]; then

        # Set the default color to the local variable fgdefault.
        local fgdefault='#[fg=44475a]'

        if [ "$(cat /sys/class/power_supply/AC/online)" == 1 ] ; then

            local icon='🗲'
            local charging='+' 

        else

            local icon=''
            local charging='-'

        fi

        # Check for existence of a battery.
        if [ -x /sys/class/power_supply/BAT0 ] ; then

            batt0=$(acpi -b 2> /dev/null | awk '/Battery 0/{print $4}' | cut -d, -f1)

            case $batt0 in

                # From 100% to 75% display color grey.
                100%|9[0-9]%|8[0-9]%|7[5-9]%) fgcolor='#[fg=brightgrey]' 
                    ;;

                # From 74% to 50% display color green.
                7[0-4]%|6[0-9]%|5[0-9]%) fgcolor='#[fg=brightgreen]' 
                    ;;

                # From 49% to 25% display color yellow.
                4[0-9]%|3[0-9]%|2[5-9]%) fgcolor='#[fg=brightyellow]' 
                    ;;

                # From 24% to 0% display color red.
                2[0-4]%|1[0-9]%|[0-9]%) fgcolor='#[fg=brightred]'
                    ;;
            esac

            # Display the percentage of charge the battery has.
            printf "%s " "${fgcolor}${icon}${charging}${batt0}%${fgdefault}"

        fi
    fi
}


function ip_address() {
    # Loop through the interfaces and check for the interface that is up.
    for file in /sys/class/net/*; do
      iface=$(basename $file);
      read status < $file/operstate;
      [ "$status" == "up"  ] && ip addr show $iface | awk '/inet /{printf $2" "}'
      done
}

function memory_usage() {

    if [ "$(which bc)" ]; then

        # Display used, total, and percentage of memory using the free command.
        read used total <<< $(free -m | awk '/Mem/{printf $2" "$3}')
        # Calculate the percentage of memory used with bc.
        percent=$(bc -l <<< "100 * $total / $used")
        # Feed the variables into awk and print the values with formating.
        awk -v u=$used -v t=$total -v p=$percent 'BEGIN {printf  "%sMi/%sMi %.1f%  ", t, u, p}'

    fi

}

function main() {
    battery_meter
    ip_address
    memory_usage

}

main














