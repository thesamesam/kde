# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="true"
KFMIN=5.64.0
QTMIN=5.12.3
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Library to deal with Apple Wallet pass files"
HOMEPAGE="https://kde.org/applications/office/kontact/"

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/karchive-${KFMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
"
RDEPEND="${DEPEND}
	!<kde-apps/kdepim-addons-18.07.80
"
