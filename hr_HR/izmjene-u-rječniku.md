# Izmjene u rječniku


Najnovija se inačica rječnika može preuzeti iz grane `master` repozitorija na adresi [github.com/krunose/hr-hunspell](https://github.com/krunose/hr-hunspell).



## Inačica 2.1


- izmijenjen ili dodan veći broj riječi
- proširen i sortiran REP do najduljih unosa do najkraćih [1]
- proširen BREAK (LO Bugzilla #106989)
- uklonjene kratice s točkom (v. problem br. 231 na [github.com/husnpell/issues](https://github.com/hunspell/hunspell/issues))
- bolji opis projekta (datoteka `README.md`)

[1] Važno je razvrstati unose u dijelu REP tako da najdulji unosi budu na vrhu, a najkraći na dnu. Ne mogu potvrditi ili točno opisati (teško je pronaći savršen primjer), ali izgleda da Hunspell primjenjuje REP po redu te uzima u obzir samo prvu zamjenu koja rezultira pravopisno točnom riječju. Odnosno, ako se na vrh popisa stavi zamjena s kratkim uvjetom koji je primjenjiv na veći broj riječi a da zamjena daje pravopisno točnu riječ, Hunspell neće ni pokušavati primijeniti zamjene koje slijede. Problem je što prva takva zamjena ne mora biti i točna, ne mora odgovarati riječi koju je korisnik pogrešno napisao, podudarnost može biti slučajna. Kratka zamjena primjenjiva na veći broj riječi može zbuniti mehanizam za predlaganje te na vrh staviti prijedlog koji nema veze s pogreškom koju je napravio korisnik. Zato treba izbjegavati zamjene poput 'c ds' (gracki > gradski) te širiti uvjete što je više moguće: 'REP rack radsk' kako bi se smanjila mogućnost primjenjivanja uvjeta 'c' na velik broj riječi. Primjer nije savršen, ali ilustrira čemu treba težiti prilikom pisanja ovih pravila. Broj je riječi koje zadovoljavaju uvjet 'c' 6447 (travanj 2017.), a broj je riječi koje zadovoljavaju potencijalnu pogrešku 'rack' (starogracki > starogradski) svega trinaest čime se uvelike smanjuje mogućnost lažno pozitivnih rezultata. Tako 'c ds' treba zamijeniti s nekoliko unosa: 'REP rack radsk' (starogracki > starogradsk), 'REP uctv udstv' (suctvo > sudstvo), 'REP recje redsje' (precjednik > predsjednik) itd. Potrebno je napraviti analizu te ustanoviti kada se više takvih unosa mogu svesti pod jedan radi ekonomičnosti, ali je vrlo važno ograničiti ispunjenje uvjeta samo na željene riječi te je zbog toga najkraće uvjete potrebno staviti na dno jer su potencijalno (pogrešno) primjenjivi na (pre)velik broj riječi. Prvo je potrebno pokušati sa specifičnim, a tek onda općenitim.


---

## Inačica 2.0

veljača 2017.

Strukturna revizija i kompletna izmjene inačice 1.0.

- definiranje novih pravila tvorbe riječi u hr_HR.aff datoteci.
- znatno reduciranje ukupnog broja riječi u hr_HR.dic isključivanjem riječi izvedenih novim pravilima tvorbe iz temeljne riječi.
- proširenje rječnika dodavanjem novih riječi.
- inicijalno testiranje i analiza skupova riječi, usuglašavanje razlika u odnosu na inačicu 1.1

Velika hvala Mirku Kosu koji je pripremio ovu inačicu.


---

## Inačica 1.1

god. 2014.

Nadopuna i nadogradnja inačice 0.1

- dodana kompresija nastavaka (engl. alias compression)
- pretvorba iz ISO8859-2 u UTF-8
- dodane nove riječi
- uklonjena pogreške uzrokovane računalnom obradom liste riječi u inačici 1.0

---

## Inačica 1.0

[2003.]

Originalni rječnik - autor D. L. iz 2003. g. [1]

---

[1] http://cvs.linux.hr/spell/
