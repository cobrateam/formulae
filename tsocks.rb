require 'formula'

class Tsocks <Formula
  head 'git://github.com/pc/tsocks.git'
  
  # original, http://tsocks.sourceforge.net/, github
  # repo is a maintained fork with OSX support
  homepage 'http://github.com/pc/tsocks'
  md5 'ecb2d291b475122391488f063d17db02'
  
  def initialize(*args)
    super
    @version = '1.9'
  end

  def install
    system "autoconf"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make && make install"
    (etc + "tsocks.conf").write(File.read('tsocks.conf.simple.example'))
  end
  
  def patches
    DATA
  end
end

__END__
diff --git a/tsocks b/tsocks
index 3532c8b..0dc1e73 100755
--- a/tsocks
+++ b/tsocks
@@ -42,7 +42,7 @@ if [ $# = 0 ] ; then
    exit
 fi
 
-LIBDIR="/lib"
+LIBDIR="/usr/local/lib"
 LIB_NAME="libtsocks"
 SHLIB_EXT="dylib"
 SHLIB="${LIBDIR}/${LIB_NAME}.${SHLIB_EXT}"
