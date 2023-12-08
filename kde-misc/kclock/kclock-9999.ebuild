# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_CATEGORY="utilities"
KFMIN=5.245.0
QTMIN=6.6.0
inherit ecm gear.kde.org

DESCRIPTION="Convergent clock application for Plasma"
HOMEPAGE="https://apps.kde.org/kclock/"

LICENSE="CC0-1.0 CC-BY-4.0 GPL-2+ GPL-3+ LGPL-2.1+"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-libs/kirigami-addons:6
	>=dev-qt/qtbase-${QTMIN}:6[gui,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6[qml]
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-plasma/libplasma-${KFMIN}:6
"
RDEPEND="${DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6[qml]
"
