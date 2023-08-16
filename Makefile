TS_SRC_FILES := $(shell find src -name '*.ts')
TS_TEST_FILES := $(shell find test -name '*.ts')

run: build
	(cd build; node main.js)

build: $(TS_SRC_FILES) node_modules
	tsc --build

.test: $(TS_TEST_FILES) build
	-rm .test 2> /dev/null
	npx jest --coverage
	touch .test

node_modules: package.json package-lock.json
	npm ci

clean_build:
	-rm -rf build
	-rm .test

clean_node:
	-rm -rf node_modules

clean: clean_build clean_node
	-rm -rf coverage