#!/bin/sh

echo "==========================="
echo "  Running Post-merge hook  "
echo "==========================="

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ $1 -eq 0 ]; then
	echo "Main branch no specified. Reverting merge..."
	git reset --hard HEAD~1
	exit 0
fi

if [[ $CURRENT_BRANCH = $1 ]]; then
	# Point to the most up-to-date commit of the tracked submodule branch
	echo "Updating remote to lastest commit..."
	git submodule update --remote

	if [[ $? -eq 0 ]]; then
		echo "Already pointing to lastest commit on submodule's master branch. No extra commit needed."
	else
		# Commit the newly pointed reference of the submodule
		git add . 
		git commit -m "POST-MERGE HOOK: Updates reference to submodule master branch"
		git push
	fi
else
	echo "Not a Develop branch. Nothing to do here."
fi
echo "Post-merge hook completed."
