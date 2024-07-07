ROOT_DIR = $(realpath .)

RELEASE_PARAMS = --release --obfuscate --split-debug-info=/Users/joao/Desktop/dev/projects/personal/flutter_structure/obfuscate

install: clean clean_get build_runner create_splash

get:
	@flutter pub get

pod_install:
	@cd ios && rm -rf Podfile.lock && pod install --repo-update --clean-install

clean_get: remove_lock get

clean: remove_lock
	@flutter clean

remove_lock:
	@find . -name "*pubspec.lock" -type f -delete; \

build_runner:
	@find . -name "*.g.dart" -type f -delete && \
	dart run build_runner build --delete-conflicting-outputs

upgrade: remove_lock
	@flutter pub upgrade && \

auto_fix: format
	@dart fix --apply

format:
	@dart format --fix .

packages_upgrade:
	@flutter packages upgrade

create_splash:
	@dart run flutter_native_splash:create

create_icon: install
	@dart pub run flutter_launcher_icons

git_clean:
	@echo "Cleaning remote..."
	@git remote prune origin
	@echo "Cleaning local..."
	@git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done

build_appbundle:
	@flutter build appbundle $(RELEASE_PARAMS)

build_ipa:
	@flutter build ipa $(RELEASE_PARAMS)

build_apk_dry: create_splash
	@flutter build apk $(RELEASE_PARAMS)

build_version: install create_splash build_appbundle build_ipa

build_version_dry: build_appbundle build_ipa

create_feature:
	@cd lib/src/features && \
	mkdir -p $(name) && \
	cd $(name) && \
	mkdir -p data && \
	cd data && \
	mkdir -p data_sources && \
	mkdir -p models && \
	mkdir -p repositories && \
	cd .. && \
	mkdir -p domain && \
	cd domain && \
	mkdir -p entities && \
	mkdir -p enums && \
	mkdir -p exceptions && \
	mkdir -p repositories && \
	mkdir -p use_cases && \
	cd .. && \
	mkdir -p presentation && \
	cd presentation && \
	mkdir -p module && \
	mkdir -p pages && \
	mkdir -p controller && \
	mkdir -p widgets