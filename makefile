ROOT_DIR = $(realpath .)

pod_install:
	@cd ios && rm -rf Podfile.lock && pod install --repo-update --clean-install

build_runner:
	@dart run build_runner build --delete-conflicting-outputs

packages_upgrade:
	@flutter packages upgrade

remove_lock:
	@find . -name "*pubspec.lock" -type f -delete

get:
	@flutter pub get

clean_get: clean_all get

clean_all: remove_lock clean

clean: 
	@flutter clean

upgrade: remove_lock && flutter pub upgrade

install: clean_get build_runner

translation: flutter gen-l10n

git_clean:
	@echo "Cleaning remote..."
	@git remote prune origin
	@echo "Cleaning local..."
	@git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done

release: flutter build apk --release

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