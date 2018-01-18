# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils qmake-utils

DESCRIPTION="A jigsaw puzzle game that uses tetrominoes for the pieces"
HOMEPAGE="https://gottcode.org/tetzle/"
SRC_URI="https://gottcode.org/${PN}/${P}-src.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
"

DOCS=( ChangeLog CREDITS )

src_configure() {
	eqmake5
}

src_install(){
	emake DESTDIR="${D}" INSTALL_ROOT="${ED}" install
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}