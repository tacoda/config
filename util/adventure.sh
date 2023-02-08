#!/usr/bin/env bash

main() {
	verify_deps
	states=('red' 'green' 'blue' 'describe-spec')
	while true; do
		echo "Available states:"
		for s in "${states[@]}"; do
			echo "$s"
		done
		echo -n ">> "
		read -r state
		delegate "$state"
	done
}

verify_deps() {
    deps=('curl' 'fzf' 'jq')

    for dep in "${deps[@]}"; do
        command -v $dep >/dev/null 2>&1 || { echo >&2 "$dep is not installed.  Aborting."; exit 1; }
    done
}

delegate() {
	case "$1" in
		describe-spec)
			describe_spec
			;;

		red | ebb)
			echo "red"
			;;

		green | flow)
			echo "green"
			;;

		blue | zen | refactor)
			echo "blue"
			;;

		exit | quit)
			exit 0
			;;

		*)
			echo "No such state"
			;;
	esac
}

describe_spec() {
	# echo -n "Proceed? [y/n]: "
	# read -r ans
	# echo "$ans"
	echo "describe a spec"
	fzf
}

main
