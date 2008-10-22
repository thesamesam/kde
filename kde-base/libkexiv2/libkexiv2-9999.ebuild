# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME="kdegraphics"
KMMODULE=libs/libkexiv2
NEED_KDE="svn"

inherit kde4svn-meta

DESCRIPTION="KDE Image Plugin Interface: an exiv2 library wrapper"
HOMEPAGE="http://www.kipi-plugins.org"

LICENSE="GPL-2"
KEYWORDS=""
IUSE=""
SLOT="kde-svn"

DEPEND="media-gfx/exiv2
	media-libs/jpeg
	media-libs/lcms"
RDEPEND="${DEPEND}"

# Install to KDEDIR to slot the package
PREFIX="${KDEDIR}"
