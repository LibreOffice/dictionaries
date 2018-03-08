Proyek ini adalah kelanjutan dari ekstensi Kamus Indonesia pada [Libre Office](http://extensions.libreoffice.org/extension-center/indonesian-dictionary-kamus-indonesia-by-benitius/releases/2.0).

# Pembuatan

* Unduh sumber repositori lewat
  * https://github.com/shuLhan/hunspell-id/archive/master.zip, atau
  * gandakan dengan git
```
$ git clone git@github.com:shuLhan/hunspell-id.git
```
* Jika mengunduh zip, ekstrak berkas zip tersebut.

## Extensi untuk LibreOffice

* Pindah ke direktori sumber repositori
```
$ cd hunspell-id
```
* Eksekusi skrip `build.sh` pada direktori sumber
```
$ ./build.sh
```
* Skrip tersebut akan menghasilkan berkas `hunspell-id.oxt` di direktori sekarang.
* Buka pengatur berkas, dan klik dua kali pada berkas `hunspell-id.oxt` tersebut, maka nanti layanan pemasangan ekstensi LibreOffice akan muncul.

# Pemasangan

## Sistem Operasi GNU/Linux
* Login sebagai root
* Buat `symlink` dari hasil ekstraksi ke folder sistem hunspell Anda. Contoh,
```
$ cd /usr/share/hunspell
$ ln -s ~/Downloads/hunspell-di/id_ID.aff
$ ln -s ~/Downloads/hunspell-di/id_ID.dic
```
* atau buat salinan langsung.

## Paket GNU/Linux
* Arch Linux: https://aur.archlinux.org/packages/hunspell-id-git/
* Solus: `sudo eopkg it hunspell-id`

# Kredit
* Benitius Brevoort
* Viko Adi Rahmawan
* Ammar Shadiq
* Arno Brevoort
* Volker Mueller
* Kurniadi

# Sejarah Pembuatan
Versi 1.0, 1.1, dan 1.2 diciptakan tahun 2004 dengan bantuan Kurniadi dan Volker Mueller serta Arno Brevoort, yang menyumbangkan daftar kata mereka sebagai dasar penyusunan berkas tersebut bagi program MySpell, yang dipakai oleh OpenOffice.org. Sesudah itu bertahun-tahun lamanya tidak dikerjakan lagi.

Tanggal 05 Mei 2009 Ammar Shadiq menuangkan berkas-berkas lama itu dalam bentuk ekstensi bagi OpenOffice dan mengunggahnya ke sana. Ekstensi yang sama ini diunggah ke LibreOffice pada tanggal 19 Mei 2012 sebagai Indonesian dictionary - Kamus Indonesia 1.0. Viko Adi Rahmawan kemudian menguji ekstensi ini kembali dan pada tanggal 16 Mei 2014 diterbitkan sebagai Indonesian dictionary - Kamus Indonesia 1.1 bagi LibreOffice 4.0.

Versi 2.0 merupakan pengerjaan ulang dari kedua berkas `id_ID.dic` dan `id_ID.aff` agar lebih sesuai dengan sifat Bahasa Indonesia. Berkas .aff (affiks) diperbaharui samasekali, sehingga jauh lebih sesuai dengan sifat bahasa Indonesia dengan awalan, akhiran dan imbuhan. Berkas .dic (daftar kata) diperiksa dengan semua lemma dari Kamus Besar Bahasa Indonesia, edisi 3. Berkas hyphenator tidak mengalami perubahan.
