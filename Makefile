.PHONY: bootstrap dotfiles git verify all

bootstrap:
	./scripts/bootstrap.sh

dotfiles:
	./scripts/link-dotfiles.sh

git:
	./scripts/configure-git.sh

verify:
	./scripts/verify.sh

all: bootstrap dotfiles git verify
