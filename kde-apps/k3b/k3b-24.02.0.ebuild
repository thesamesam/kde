# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
ECM_TEST="true"
PVCUT=$(ver_cut 1-3)
KFMIN=5.113.0
QTMIN=5.15.9
inherit ecm gear.kde.org

DESCRIPTION="Full-featured burning and ripping application based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/k3b/ https://userbase.kde.org/K3b"

LICENSE="GPL-2 FDL-1.2"
SLOT="5"
KEYWORDS="~amd64"
IUSE="dvd ffmpeg flac lame mad musepack sndfile sox taglib vcd vorbis webengine"

REQUIRED_USE="flac? ( taglib ) lame? ( taglib ) sox? ( taglib )"

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-apps/libkcddb-23.08.4:5
	>=kde-frameworks/karchive-${KFMIN}:5
	>=kde-frameworks/kbookmarks-${KFMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kfilemetadata-${KFMIN}:5[taglib?]
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kjobwidgets-${KFMIN}:5
	>=kde-frameworks/knewstuff-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/knotifyconfig-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/solid-${KFMIN}:5
	media-libs/libsamplerate
	dvd? ( media-libs/libdvdread:= )
	ffmpeg? ( media-video/ffmpeg:0= )
	flac? ( >=media-libs/flac-1.2:=[cxx] )
	lame? ( media-sound/lame )
	mad? ( media-libs/libmad )
	musepack? ( >=media-sound/musepack-tools-444 )
	sndfile? ( media-libs/libsndfile )
	taglib? ( >=media-libs/taglib-1.5:= )
	vorbis? (
		media-libs/libogg
		media-libs/libvorbis
	)
	webengine? ( >=dev-qt/qtwebengine-${QTMIN}:5[widgets] )
"
RDEPEND="${DEPEND}
	app-cdr/cdrdao
	app-cdr/cdrtools
	dev-libs/libburn
	media-sound/cdparanoia
	dvd? ( >=app-cdr/dvd+rw-tools-7 )
	sox? ( media-sound/sox )
	vcd? ( media-video/vcdimager )
"

DOCS+=( ChangeLog {FAQ,PERMISSIONS,README}.txt )

src_configure() {
	local mycmakeargs=(
		-DK3B_BUILD_API_DOCS=OFF
		-DK3B_BUILD_EXTERNAL_ENCODER_PLUGIN=ON
		-DK3B_BUILD_WAVE_DECODER_PLUGIN=ON
		-DK3B_ENABLE_HAL_SUPPORT=OFF
		-DK3B_ENABLE_MUSICBRAINZ=OFF
		-DK3B_DEBUG=$(usex debug)
		-DK3B_ENABLE_DVD_RIPPING=$(usex dvd)
		-DK3B_BUILD_FFMPEG_DECODER_PLUGIN=$(usex ffmpeg)
		-DK3B_BUILD_FLAC_DECODER_PLUGIN=$(usex flac)
		-DK3B_BUILD_LAME_ENCODER_PLUGIN=$(usex lame)
		-DK3B_BUILD_MAD_DECODER_PLUGIN=$(usex mad)
		-DK3B_BUILD_MUSE_DECODER_PLUGIN=$(usex musepack)
		-DK3B_BUILD_SNDFILE_DECODER_PLUGIN=$(usex sndfile)
		-DK3B_BUILD_SOX_ENCODER_PLUGIN=$(usex sox)
		-DK3B_ENABLE_TAGLIB=$(usex taglib)
		-DK3B_BUILD_OGGVORBIS_DECODER_PLUGIN=$(usex vorbis)
		-DK3B_BUILD_OGGVORBIS_ENCODER_PLUGIN=$(usex vorbis)
		$(cmake_use_find_package webengine Qt5WebEngineWidgets)
	)

	ecm_src_configure
}

pkg_postinst() {
	ecm_pkg_postinst

	elog "If you get warnings on start-up, uncheck the \"Check system"
	elog "configuration\" option in the \"Misc\" settings window."
	elog
	local group=cdrom
	use kernel_linux || group=operator
	elog "Make sure you have proper read/write permissions on optical device(s)."
	elog "Usually, it is sufficient to be in the ${group} group."
}
