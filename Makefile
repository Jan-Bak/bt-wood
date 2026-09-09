.PHONY: bump-version-major bump-version-minor bump-version-patch

bump-version-major:
	@npm version major && git push origin main --tags

bump-version-minor:
	@npm version minor && git push origin main --tags

bump-version-patch:
	@npm version patch && git push origin main --tags
