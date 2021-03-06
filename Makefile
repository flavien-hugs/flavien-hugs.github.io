SHELL := /bin/bash
NPM := npm
VENDOR_DIR_JS := assets/vendor/js/
VENDOR_DIR_CSS := assets/vendor/css/
JEKYLL := jekyll

PROJECT_DEPS := package.json

install:
	$(NPM) install

update:
	$(NPM) update

npm-deps:
	mkdir -p $(VENDOR_DIR_JS)
	cp node_modules/jquery/dist/jquery.min.js $(VENDOR_DIR_JS)
	cp node_modules/popper.js/dist/umd/popper.min.js $(VENDOR_DIR_JS)
	cp node_modules/bootstrap/dist/js/bootstrap.min.js $(VENDOR_DIR_JS)
	cp node_modules/owl.carousel/dist/owl.carousel.min.js $(VENDOR_DIR_JS)
	mkdir -p $(VENDOR_DIR_CSS)
	cp node_modules/bootstrap/dist/css/bootstrap.min.css $(VENDOR_DIR_CSS)

build: npm-deps
	$(JEKYLL) build

serve: npm-deps
	JEKYLL_ENV=production $(JEKYLL) serve

# generate-githubpages
generate-githubpages:
	rm -fr docs && JEKYLL_ENV=production $(JEKYLL) build --baseurl https://flavien-hugs.github.io -d docs/ && touch docs/.nojekyll
