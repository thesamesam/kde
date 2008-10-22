# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
SLOT="kde-svn"

KMNAME=kdewebdev
inherit kde4svn-meta

DESCRIPTION="KDE web development - link validity checker"
KEYWORDS=""
IUSE="debug tidy"

HOMEPAGE="http://www.kde.org/"

DEPEND="
	tidy? ( app-text/htmltidy )"

src_compile() {
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_with tidy LibTidy)"

	kde4overlay-meta_src_compile
}
