tar -xvzf msodbcsql-13.0.0.0.tar.gz
tar -xvzf unixodbc-2.3.1.tar.gz
echo "123" | sudo -S apt remove unixodbc
cd unixODBC-2.3.1
CPPFLAGS="-DSIZEOF_LONG_INT=8"
export CPPFLAGS
./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc --enable-gui=no --enable-drivers=no --enable-iconv --with-iconv-char-enc=UTF8 --with-iconv-ucode-enc=UTF16LE
echo "123" | sudo -S make
echo "123" | sudo  -S make install

