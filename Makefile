#  __  __       _         __ _ _      
# |  \/  | __ _| | _____ / _(_) | ___ 
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ \
# | |  | | (_| |   <  __/  _| | |  __/
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___|
#                                     
SHELL := /bin/sh
TIME  := $(shell date '+%s')
RUBY  ?= ruby
JRUBY ?= /usr/local/jr
RAKE  ?= rake
MKDIR := mkdir -p
CP    := cp
RM    := rm -f

.DEFAULT_GOAL = git-status
REPOS_TARGETS = git-status git-push git-commit-amend git-tag-list git-diff \
				git-reset-soft git-rm-cached git-branch

.PHONY: clean
git-status:
	git status

push:
	for G in github; do \
		git push --tags $$G master; \
	done

