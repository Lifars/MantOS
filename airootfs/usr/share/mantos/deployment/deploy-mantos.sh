#!/bin/bash

# description: deployment script for MantOS.

# global configuration variables
verbose="/dev/null"

# params: zero
# description: shows usage message.
function usage()
{
    echo "usage: ${0} -t <type>"
    echo
    echo "    <type>: type of deployment: x, y, z."
    echo "    -v: verbose output."

    exit 1
}

# params: zero.
# description: check if we have root privileges.
function check_root()
{
    if [ "$(id -u)" != 0 ]; then
        echo "You should be root to run this application."
        exit 1
    fi

    return 0
}

# params:
#	$1 - array with the names of the groups to be installed (filenames).
# description: install packages from a given type of deployment.
function install_type()
{
	if [[ -z "${*}" ]]; then
		echo "You have to supply a type to be installed."
		exit 1
	fi
		
	for run in "${@}"; do
		local packages
		
		if [[ ! -f "${run}.packages" ]]; then
			echo "There is no file for ${run}."
			continue
		fi
		
		packages=($(cat ${run}.packages))
		if ! pacman -Sy --needed --overwrite '*' --noconfirm "${packages[@]}" \
			&>> "${verbose}"
		then
			return 1
		else
			echo "Done with: ${run}."
		fi
	done
	
	return 0
}

# params:
#   -t OPTARG - type of deployment to be done.
# description: entry point of the application.
function main()
{
	local type

	while getopts "t:v" options; do
        case "${options}" in
        t)
            type="${OPTARG}"
            ;;
        v)
			verbose="/dev/stdout"
			;;
        *)
            usage
            ;;
        esac
    done
    
    case "${type}" in
    x)
		echo "Hit x options."
		;;
    y)
		echo "Hit y options."
		;;
    z)
		echo "Hit z options."
		;;
    *)
		usage ;;
	esac
	
	if ! install_type "common" "${type}"; then
		echo "Something is wrong. Exiting..."
		exit 1
	fi
	
	return 0
}

# entry point of the application.
main "${@}"
