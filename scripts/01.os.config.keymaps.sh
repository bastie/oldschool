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

# (1) clearing of unwanted keymaps for terminal like not target hardware plattform keymaps
## (1.1) remove keymaps without follow grep pattern
ls /usr/src/share/vt/keymaps/* | grep -v "Makefile" | grep -v "INDEX" | grep -v "macbook" | grep -v "/de" | xargs rm -f 

## (1.2) change INDEX.keymaps with new selection of keymaps (and without outcommented uk keymaps)
cat /usr/src/share/vt/keymaps/INDEX.keymaps | egrep "^(MENU|FONT|#|macbook|de)" | grep -v ^#uk >/tmp/os.INDEX.keymaps
cp /tmp/os.INDEX.keymaps /usr/src/share/vt/keymaps/INDEX.keymaps

## (1.3) change Makefile
cat /usr/src/share/vt/keymaps/Makefile | egrep "^(.include|FILESDIR|FILES|#)|de.|macbook|^\s*$" >/tmp/os.Makefile.vt.keymaps
cp /tmp/os.Makefile.vt.keymaps /usr/src/share/vt/keymaps/Makefile

### EOF
