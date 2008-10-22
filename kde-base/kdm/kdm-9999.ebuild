# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

KMNAME=kdebase-workspace
inherit kde4svn-meta

DESCRIPTION="KDE login manager, similar to xdm and gdm"
KEYWORDS=""
IUSE="debug htmlhandbook kerberos pam"

DEPEND="x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXtst
	kerberos? ( virtual/krb5 )
	pam? ( >=kde-base/kcheckpass-${PV}:${SLOT}
		sys-libs/pam )"
RDEPEND="${DEPEND}
	>=kde-base/kdepasswd-${PV}:${SLOT}
	>=x11-apps/xinit-1.0.5-r2
	x11-apps/xmessage"

KMEXTRACTONLY="kcontrol/kdm/"
KMEXTRA="libs/kdm/"

src_compile() {
	epatch "${FILESDIR}"/kdebase-4.0.82-pam-optional.patch
	mycmakeargs="${mycmakeargs}
		$(use kerberos && echo "-DKDE4_KRB5AUTH=ON" || echo "-DKDE4_KRB5AUTH=OFF")
		$(cmake-utils_use_with pam PAM)"

	kde4overlay-meta_src_compile
}

src_install() {
	export GENKDMCONF_FLAGS="--no-old --no-backup"

	kde4overlay-meta_src_install

	# Customize the kdmrc configuration
	sed -i -e "s:^.*SessionsDirs=.*$:#&\nSessionsDirs=/usr/share/xsessions:" \
		"${D}"/${PREFIX}/share/config/kdm/kdmrc \
		|| die "Failed to set SessionsDirs correctly."

	# Don't install empty dir
	rmdir "${D}${KDEDIR}"/share/config/kdm/sessions
}

pkg_postinst() {
	# Set the default kdm face icon if it's not already set by the system admin
	# because this is user-overrideable in that way, it's not in src_install
	if [[ ! -e "${ROOT}${KDEDIR}/share/apps/kdm/faces/.default.face.icon" ]];	then
		mkdir -p "${ROOT}${KDEDIR}/share/apps/kdm/faces"
		cp "${ROOT}${KDEDIR}/share/apps/kdm/pics/users/default1.png" \
			"${ROOT}${KDEDIR}/share/apps/kdm/faces/.default.face.icon"
	fi
	if [[ ! -e "${ROOT}${KDEDIR}/share/apps/kdm/faces/root.face.icon" ]]; then
		mkdir -p "${ROOT}${KDEDIR}/share/apps/kdm/faces"
		cp "${ROOT}${KDEDIR}/share/apps/kdm/pics/users/root1.png" \
			"${ROOT}${KDEDIR}/share/apps/kdm/faces/root.face.icon"
	fi
}
