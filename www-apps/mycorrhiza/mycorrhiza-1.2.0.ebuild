# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
"github.com/andybalholm/brotli v1.0.0/go.mod"
"github.com/bouncepaw/mycomarkup v0.5.7"
"github.com/bouncepaw/mycomarkup v0.5.7/go.mod"
"github.com/go-ini/ini v1.62.0"
"github.com/go-ini/ini v1.62.0/go.mod"
"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
"github.com/gorilla/feeds v1.1.1"
"github.com/gorilla/feeds v1.1.1/go.mod"
"github.com/jtolds/gls v4.20.0+incompatible"
"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
"github.com/klauspost/compress v1.10.7/go.mod"
"github.com/klauspost/compress v1.11.0/go.mod"
"github.com/kr/pretty v0.2.1"
"github.com/kr/pretty v0.2.1/go.mod"
"github.com/kr/pty v1.1.1/go.mod"
"github.com/kr/text v0.1.0"
"github.com/kr/text v0.1.0/go.mod"
"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
"github.com/smartystreets/goconvey v1.6.4"
"github.com/smartystreets/goconvey v1.6.4/go.mod"
"github.com/valyala/bytebufferpool v1.0.0"
"github.com/valyala/bytebufferpool v1.0.0/go.mod"
"github.com/valyala/fasthttp v1.16.0/go.mod"
"github.com/valyala/quicktemplate v1.6.3"
"github.com/valyala/quicktemplate v1.6.3/go.mod"
"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9"
"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
"golang.org/x/net v0.0.0-20200602114024-627f9648deb9/go.mod"
"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
"golang.org/x/sys v0.0.0-20200602225109-6fdc65e7d980/go.mod"
"golang.org/x/text v0.3.0/go.mod"
"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
"gopkg.in/ini.v1 v1.62.0"
"gopkg.in/ini.v1 v1.62.0/go.mod"
)

go-module_set_globals

DESCRIPTION="Git-based wiki engine written in Go using mycomarkup"
HOMEPAGE="https://mycorrhiza.wiki"

KEYWORDS="~amd64 ~arm ~arm64"
SRC_URI="
	https://github.com/bouncepaw/mycorrhiza/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="AGPL-3 MIT Apache-2.0 BSD BSD-2"
SLOT="0"
DOCS=( README.md )

BDEPEND=">=dev-lang/go-1.16.0"

RDEPEND="
	dev-vcs/git
	!!www-apps/mycorrhiza-bin
"

DEPEND="${RDEPEND}"

src_compile() {
	go build -ldflags '-s' . || die
}

src_install() {
	dobin mycorrhiza
}

pkg_postinst() {
	elog "Quick start: mycorrhiza /your/wiki/directory"
	elog
	elog "It will initialize a Git repository and set useful defaults,"
	elog "Prepopulate the config file and run a server on localhost:1737"
	elog "More information here: https://mycorrhiza.wiki/"
}
