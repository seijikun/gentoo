# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=DANIEL
MODULE_VERSION=1.7
inherit perl-module

DESCRIPTION="Perl interface to Alec Muffett's Cracklib"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="sys-libs/cracklib"
DEPEND="${RDEPEND}"

SRC_TEST="do"

src_prepare() {
	use test && perl_rm_files t/pod-coverage.t t/pod.t
	sed -i -e 's/use inc::Module::Install;/use lib q[.]; use inc::Module::Install;/' Makefile.PL ||
		die "Can't patch Makefile.PL for 5.26 dot-in-inc"
	perl-module_src_prepare
}
