.PHONY: site serve deploy

# Clean build.
site:
	rm -rf public
	zola build

serve:
	zola serve

# Deployment.
RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh --perms --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r
DEST := cslinux:/courses/cs7491/2020sp
deploy: site
	rsync $(RSYNCARGS) ./public/ $(DEST)
