#
# Copyright 2019 Sͬeͥbͭaͭsͤtͬian
#
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this 
# list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, 
# this list of conditions and the following disclaimer in the documentation and/or 
# other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
# POSSIBILITY OF SUCH DAMAGE.
#

# first get this file from github and start it with
# fetch --no-verify-peer https://raw.githubusercontent.com/bastie/oldschool/master/scripts/createOS.sh
# sh ./createOS.sh

# get sources from FreeBSD
# Release 12.0
svnlite checkout --non-interactive --trust-server-cert https://svn.freebsd.org/base/releng/12.0 /usr/src

# patch the sources
. ./01.os.config.keymaps.sh   # include script to change supported keymaps  

# go to src dir
cd /usr/src

# build and install
make -j 8 TARGET=amd64 TARGET_ARCH=amd64 buildworld buildkernel installkernel installworld

# go to release dir
cd /usr/src/release

# create release media under /usr/obj/usr/src/amd64.amd64/release/
make -DNOPORTS -DNODOC -DNOSRC -DSRC_UPDATE_SKIP -DDOC_UPDATE_SKIP -DPORTS_UPDATE_SKIP -DWITH_DVD cdrom

### EOF
