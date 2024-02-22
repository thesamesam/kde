# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
PYTHON_COMPAT=( python3_{10..12} )
PVCUT=$(ver_cut 1-3)
KFMIN=5.249.0
QTMIN=6.6.2
inherit python-single-r1 ecm gear.kde.org

DESCRIPTION="Classical Mah Jongg for four players"
HOMEPAGE="https://apps.kde.org/kajongg/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-db/sqlite:3
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-apps/libkdegames-${PVCUT}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	$(python_gen_cond_dep '
		dev-python/QtPy[gui,svg,widgets,${PYTHON_USEDEP}]
		>=dev-python/twisted-16.6.0[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}
	>=kde-apps/libkmahjongg-${PVCUT}:6
"

pkg_setup() {
	python-single-r1_pkg_setup
	ecm_pkg_setup
}

src_prepare() {
	python_fix_shebang src
	ecm_src_prepare
}
