#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: maui-apps-git" \
	"Version: 0.1.8-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Provides: maui-apps" \
	"Replaces: maui-apps-extra-git" \
	"Architecture: amd64" \
	"Description: Maui Apps metapackage for Nitrux."

equivs-build configuration
