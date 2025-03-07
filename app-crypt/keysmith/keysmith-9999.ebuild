# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_CATEGORY="utilities"
ECM_TEST="true"
KFMIN=5.249.0
QTMIN=6.6.2
inherit ecm gear.kde.org

DESCRIPTION="OTP client for Plasma Mobile and Desktop"
HOMEPAGE="https://apps.kde.org/keysmith/"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-libs/kirigami-addons:6
	dev-libs/libsodium:=
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
"
DEPEND="${RDEPEND}
	>=dev-qt/qtbase-${QTMIN}:6[concurrent]
"
