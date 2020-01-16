.PHONY: local all

watch:
	jekyll build --safe -d ./local --watch

local:
	jekyll build --safe -d ./local

all:
	jekyll build --safe -d /Volumes/webpages/computational.linguistics.illinois.edu/ling490/Spring2020

