# By using tclibc-newlib we loose sysroot functionality due to some
# append/override behavior We need to get that back , the following append
# overrides everything on EXTRA_OECONF for gcc cross target it avoids
# overlapping with crt0 because of --enable-linker-id from EXTRA_OECONF


GCC_CONFIGURE_COMMON_XILINX_STANDALONE = " \
	--disable-libmudflap \
	--disable-libstdcxx-pch \
	--disable-nls \
	--enable-languages=${LANGUAGES} \
	--with-newlib \
"

# This is still missing a way to remove infiniarray, if we really have to we could use _remove
EXTRA_OECONF_pn-gcc-cross-${TARGET_ARCH}_xilinx-standalone = " \
    ${GCC_CONFIGURE_COMMON_XILINX_STANDALONE} \
    --program-prefix=${TARGET_PREFIX} \
    --without-local-prefix \
    ${EXTRA_OECONF_PATHS} \
"
