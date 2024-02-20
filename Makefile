CUR_DIR = $(CURDIR)

# =====================================================================
# 	run
# =====================================================================
	
env:
	echo 'FEATHER_WORK_DIR="$(CUR_DIR)/"' > .env.development

clean:
	rm -rf ./Resources/ ./Public/

run:
	swift run App

# =====================================================================
# 	testing
# =====================================================================


env.testing:
	echo 'FEATHER_WORK_DIR="$(CUR_DIR)/Tests/"' > .env.testing
		
clean.testing:
	rm -rf ./Tests/Resources/ ./Tests/Public/

test: clean.testing env.testing
	swift test

# =====================================================================
# 	install
# =====================================================================

install:
	swift package update
	swift build -c release
	install .build/Release/App ./app #./usr/local/bin/app

uninstall:
	rm ./app

# =====================================================================
# 	test-dev
# =====================================================================

test-dev:
	cd .. && \
	git clone --branch test-dev https://github.com/xcode73/feather-core && \
	git clone --branch test-dev https://github.com/xcode73/user-module && \
	git clone --branch test-dev https://github.com/xcode73/web-module && \
	git clone --branch test-dev https://github.com/xcode73/analytics-module && \
	git clone --branch test-dev https://github.com/xcode73/aggregator-module && \
	git clone --branch test-dev https://github.com/xcode73/blog-module && \
	git clone --branch test-dev https://github.com/xcode73/markdown-module && \
	git clone --branch test-dev https://github.com/xcode73/redirect-module && \
	git clone --branch test-dev https://github.com/xcode73/swifty-module && \
	cd feather

update:
	cd .. && \
	cd feather-core && git pull && cd .. && \
	cd user-module && git pull && cd .. && \
	cd web-module && git pull && cd .. && \
	cd analytics-module && git pull && cd .. && \
	cd aggregator-module && git pull && cd .. && \
	cd blog-module && git pull && cd .. && \
	cd markdown-module && git pull && cd .. && \
	cd redirect-module && git pull && cd .. && \
	cd swifty-module && git pull && cd .. && \
	cd feather

wrk:
	wrk -t12 -c400 -d30s http://localhost:8080/  
