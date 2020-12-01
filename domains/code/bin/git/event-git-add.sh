#!/usr/bin/env zsh
# encoding: UTF-8

# TODO: (current git config has this alias but look into ensuring no issues from any combination of cwd and target directory)
# [alias]
#	  ad = !./domains/code/bin/git/event-git-add.sh $@ && git add
# TODO:

# TODO: error on being given more than one parem

 for i; do 
    RESULTS=$(ruby ./domains/code/bin/git/event-git-add.rb "$i")
    EXIT_CODE=$?
    if [ $EXIT_CODE -ne 0 ]; then
      #echo $RESULTS
      echo "got error-code{${EXIT_CODE}} when trying to add path{$i}"
      exit 137
    else
      #echo $RESULTS
      echo "path{$i} passed syntax checks"
    fi
 done

exit 0