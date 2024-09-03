# Makefile for deploying Flutter web app to GitHub Pages

# Update These Variables
BASE_HREF = '/invitation/'
GITHUB_REPO = git@github.com:Karunanidi/invitation.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	fvm flutter clean

	@echo "Getting packages..."
	fvm flutter pub get

	@echo "Building for web..."
	fvm flutter build web --web-renderer html --base-href $(BASE_HREF) --release

	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Finished Deploy!!"

.PHONY: deploy-web