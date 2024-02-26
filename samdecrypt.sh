#!/bin/bash
#find your key in fumagician or check known_keys.txt
#look for base64 or use this oneliner: strings fumagician | grep -E '^[A-Za-z0-9+/]{42}[AEIMQUYcgkosw048]=$' | base64 -d | xxd -p -c 32

set -xe

key=$(cat ./key)

openssl enc -aes-256-ecb -d -in "$1" -nopad -K "$key" > "${1/.enc/.bintemp}"
magic=5f696369616e4d41475f402a212e3826
check=$(xxd -s 0 -l 16 -p "${1/.enc/.bintemp}")

if [[ "$magic" == "$check" ]];
        then
            size=$(perl -le 'seek STDIN, 16, 0; read STDIN, my $buf, 4; print unpack q/V/, $buf;' < "${1/.enc/.bintemp}")
            tail -c +33 < "${1/.enc/.bintemp}" | head -c "$size" > "${1/.enc/.bin}"
            rm "${1/.enc/.bintemp}"
        else
            rm "${1/.enc/.bintemp}"
            printf 'Signature match fail (wrong key or file).\n'
fi
