# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=5.245.0
QTMIN=6.6.2
inherit ecm kde.org

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/unstable/${PN}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
fi

DESCRIPTION="Visual end user components for Kirigami-based applications"
HOMEPAGE="https://invent.kde.org/libraries/kirigami-addons"

LICENSE="|| ( GPL-2 GPL-3 LGPL-3 ) LGPL-2.1+"
SLOT="6"
IUSE=""

# would profit from VIRTUALX_REQUIRED=test, but then still requires
# org.qt-project.qt.mediaplayer service and fails, bug 911186
RESTRICT="test"

COMMON_DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
"
RDEPEND="${COMMON_DEPEND}
	>=dev-qt/qt5compat-${QTMIN}:6[qml]
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	kde-plasma/libplasma:6
"
DEPEND="${COMMON_DEPEND}
	test? (
		>=dev-qt/qtmultimedia-${QTMIN}:6[gstreamer,qml]
		media-libs/gst-plugins-base:1.0[ogg,vorbis]
		media-libs/gst-plugins-bad:1.0
		media-libs/gst-plugins-good:1.0
		x11-themes/sound-theme-freedesktop
	)
"
