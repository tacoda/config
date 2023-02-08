#!/usr/bin/env bash

main() {
	verify_deps
	repl
}

verify_deps() {
    deps=('curl' 'fzf' 'jq')

    for dep in "${deps[@]}"; do
        command -v $dep >/dev/null 2>&1 || { echo >&2 "$dep is not installed.  Aborting."; exit 1; }
    done
}

repl() {
	states=('red' 'green' 'blue' 'describe-spec')
	while true; do
		echo
		echo "-----"
		echo "Available states:"
		echo "-----"
		for s in "${states[@]}"; do
			echo "$s"
		done
		echo "====="
		echo -n ">> "
		read -r state
		delegate "$state"
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
	echo "[Describe a spec]"
	file=$(fzf)
	rg "describe|context|it" $file
}

main
