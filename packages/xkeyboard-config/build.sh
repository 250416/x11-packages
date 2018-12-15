TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://www.freedesktop.org/wiki/Software/XKeyboardConfig/
TERMUX_PKG_DESCRIPTION="X keyboard configuration files"
TERMUX_PKG_VERSION=2.25
TERMUX_PKG_SRCURL=https://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=fec6c25a8d3931bd9afca49a1653b0fa222c85610502d7b77699bb61262934b2
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_DEPENDS="libx11"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--with-xkb-rules-symlink=xorg
--with-xkb-base=${TERMUX_PREFIX}/share/X11/xkb
--enable-compat-rules=yes
"

termux_step_post_make_install() {
    if [ -f "${TERMUX_PREFIX}/share/pkgconfig/xkeyboard-config.pc" ]; then
        mkdir -p "${TERMUX_PREFIX}/lib/pkgconfig" || exit 1
        mv -f "${TERMUX_PREFIX}/share/pkgconfig/xkeyboard-config.pc" "${TERMUX_PREFIX}/lib/pkgconfig/xkeyboard-config.pc" || exit 1
    fi
}
