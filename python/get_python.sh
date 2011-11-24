#! /bin/sh
# Install Python to /app/python-VERSION
MAIN_VERSION=2.7 # 2.6
SUBVERSION=.2 # .6
VERSION="${MAIN_VERSION}${SUBVERSION}"

cd /tmp
curl -O http://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tar.bz2
tar jxf Python-${VERSION}.tar.bz2
cd Python-${VERSION}
export LDFLAGS="-L/usr/lib/`uname -p`-linux-gnu"
./configure --prefix /apps/python-${VERSION}
make
sudo make install

# Get easy_install for package management
cd /tmp
curl -O http://pypi.python.org/packages/${MAIN_VERSION}/s/setuptools/setuptools-0.6c11-py${MAIN_VERSION}.egg
sudo env PATH=/apps/python-${VERSION}/bin:/bin:/usr/bin /bin/sh setuptools-0.6c11-py${MAIN_VERSION}.egg

# Install iPython
sudo /apps/python-${VERSION}/bin/easy_install readline ipython virtualenv pip

if ! [ -d /apps/python ]
then
    sudo rm -f /apps/python
    sudo ln -s /apps/python-${VERSION} /apps/python
fi
