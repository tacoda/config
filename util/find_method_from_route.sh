#!/usr/bin/env bash

main() {
	result=$(generate_result)
	echo $result | jq '.resource'
	echo $result | jq '.method'
	# glob=$(folder_glob)
	# echo $glob
	# echo "fd $fp $glob"
	# fd "$fp" "$glob"
	# echo $PWD/app/contollers
	# fd . $PWD/app/contollers
	# fd $results $PWD/app/contollers
}

generate_result() {
	cat ~/routes.txt | \
		fzf | \
		tr -s ' ' | \
		sd '.*\s(?P<resource>\w+)#(?P<method>\w+)' '{"resource": "$resource", "method": "$method"}' | \
		jq '.'
}

# file_pattern() {
	# echo $1 | sd '.*\s(?P<resource>\w+)#(\w+)' '$resource'
# }

# folder_glob() {
	# echo "$PWD/app/controllers"
# }

# sd '.*\s(?P<resource>\w+)#(?P<method>\w+)' '${method} _pwd_/app/controllers/${resource}_controller.rb' | \
# sd '_pwd_' "$PWD" | \
# tr -d '\n'

main
