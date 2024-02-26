mirror of https://semiconductor.samsung.com/consumer-storage/support/tools/

files are distributed there *without* a license. But they include GPL software, hence assumed all code is GPL.

process to generate them, soon to be moved to a github ci script:

```
wget 'https://semiconductor.samsung.com/resources/software-resources/Samsung_SSD_980_PRO_5B2QGXA7.iso'
bsdtar xf *iso initrd
bsdtar xf initrd root/fumagician
```

