# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME=kdesdk
KMMODULE=strigi-analyzer
inherit kde4svn-meta

DESCRIPTION="kdesdk: strigi plugins"
KEYWORDS=""
IUSE="debug"

DEPEND=">=app-misc/strigi-0.5.9"
RDEPEND="${DEPEND}"
