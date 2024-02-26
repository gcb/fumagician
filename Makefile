

.PHONY: keys
keys:
	for d in 9*; do (cd $$d; strings fumagician | grep -E '^[A-Za-z0-9+/]{42}[AEIMQUYcgkosw048]=$$' | base64 -d | xxd -p -c 32 > key); done

.PHONY: dec
dec:
	for d in 9*; do (cd $$d; ../samdecrypt.sh DSRD.enc); done
