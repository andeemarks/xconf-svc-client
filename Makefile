DISTDIR = ./dist
VERSION = $(shell cat VERSION)
REVISION = $(shell git log --pretty=format:'%h' -n 1)

.dist-dir:
	mkdir -p $(DISTDIR)

package: .dist-dir
	fpm -s dir \
		-t rpm \
		-n xconf-svc-client \
		-v $(VERSION)-$(REVISION) \
		-p dist/xconf-svc-client.rpm \
		--no-depends \
		--prefix /var/www/html \
		*

clean:
	rm -rf dist
