# Latvieðu valodas pareizrakstîbas pârbaudes bibliotçka (afiksu un vârdnîcas fails) 
# lietoðanai ar OpenOffice 2.4.x un augstâk
# Latvian spelling dictionary (affix and dictionary files) for OpenOffice 2.4.x and higher
#
# Copyright (C) 2002-2010 Janis Eisaks, jancs@dv.lv, http://dict.dv.lv
# 
# Ðî bibliotçka tiek licencçta ar Lesser General Public Licence (LGPL) 2.1 nosacîjumiem. 
# Licences nosacîjumi pievienoti failâ license.txt vai iegûstami tîmekïa vietnç  
# http://www.fsf.org/licensing/licenses/lgpl.html
# 
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# license along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#

1. Version info
2. Uzstâdîðana
3. Interesentiem
4. Izmaiòu saraksts

==================
1. Version info 0.9.3
Svarîgs paziòojums: 
ðî ir pçdçjâ vârdnîcas versija, kas ir 100% MySpell savietojama. 
Ar nâkoðo laidienu tiks uzsâkta HunSpell funkcionalitâtes ievieðana.

Izmaiòas ðajâ vesijâ:
- koriìçts SFX 6 - aizvâkts viens lieks (atkârtots) likums;
- papildinâts SFX 3 ar likumu pavçles formas veidoðanai;
- papildinâts SFX 4 ar likumiem piem., vârdu lemt, riet, siet, cirst,  pagâtnes formu veidoðanai;
- papildinâts SFX 5 ar afiksiem vârdu rît, vît apgâtnes formu iegûðanai;
- papildinâts SFX 7 ar afiksiem I konj. daïas 2. un 3. grupas vârdu tagadnes formu iegûðanai;
- papildinâts SFX 8 ar afiksiem vârdu cept, nest, òemt tagadnes formu iegûðanai;
- mainîti afiksi 2 un E;
- papildinâts vârdu krâjums;
- veikta padziïinâta vârdnîcas pârbaude, lai aizvâktu atkârtojumus, kïûdas;

Zinâmâs problçmas (kâ jau parasti):
- iztrûkstoði vârdi vai to atseviðías formas, kuras lietotâji ir laipni aicinâti iesûtît
  uz adresi dict@nospam@dv.lv (no adreses jâdzçð @nospam) vai, kam bûtu dodama priekðroka, 
  ar vietnes http://dict.dv.lv starpniecîbu darba turpinâðanai.

=================

2. Vârdîcas uzstâdîðana

Ieteikums: uzstâdît vismaz OO 3.2 versiju.
Vârdnîcas uzstâdîðana ir ïoti vienkârða - izmantojot OO Extension Manager.
Extension Manager piedâvâ iespçju kâ tieðsaistes, tâ lokâlu paplaðinâjumu uzstâdîðanu.
Ja uzstâdîðana tieðsaistes reþîmâ nav iespçjama, vajadzîgo valodas paplaðinâjumu (vârdnîcu)
var lejupielâdçt ðeit:

http://extensions.services.openoffice.org/dictionary

un izmantot lokâlai uzstâdîðanai.

Ja izmantojat OO versiju, kas neuztur Extensions (pirms 2.4.1), tad:

1. iespçja. Uzstâdîðana tieðsaistes reþîmâ
 No izvçlnes File/Wizards/Install new dictionaries palaidiet att. vedni, izvçlieties 
 Jums tîkamo vedòa valodu un sekojiet norâdîjumiem. Bez latvieðu valodas pareizrakstîbas 
 rîkiem Jûs vienlaicîgi varat uzstâdît papildus valodas vai atsvaidzinât esoðâs bibliotçkas.
 (Uzmanîbu! - nav zinâms, cik ilgi ðî bibliotçka vçl tiks aktualizçta; pilns laidienu arhîvs ir 
  atrodams http://sourceforge.net/projects/openoffice-lv/)

 Ja kaut kâdu iemeslu dçï nevarat izmantot 1. iespçju, ir
 
 2. iespçja. "Offline" uzstâdîðana
 Lejupielâdçjiet pçdçjo moduïa versiju no openoffice-lv.sourceforge.net .
 Pçc faila iegûðanas tas ir jâatpako direktorijâ %Openoffice%\share\dict\ooo, 
 kur %Openoffice% - direktorija, kurâ veikta OpenOffice uzstâdîðana. Tur esoðajam failam 
 dictionary.lst ir jâpievieno sekojoðas rindas: 
 
 DICT lv LV lv_LV
 HYPH lv LV hyph_lv_LV

 vai arî jâizpilda win-lv_LV_add.bat (Windows gadîjumâ) vai, Linux gdîjumâ, jâizpilda 
 komandu:

   sh <lin-lv_LV_add.sh

 Lai izpildîtu 2. iespçju, Jums ir jâbût tiesîbâm rakstît minçtajâ katalogâ. Ja tâdu nav, 
 varat uzstâdît vçrdnîcu lokâli, savâ lietotâja opciju katalogâ (%OOopt%/user/wordbook).

 Offline uzstadîðanai var izmantot arî 1. iespçjâ minçto vedni, viss notiks lîdzîgi, 
 tikai nepiecieðamajâm moduïu pakotnçm bûs jâbût uz lokâlâ diska. Jâpiezîmç ka, piemçram, 
 SUSE gadîjumâ minçtais vednis ir izgriezts ârâ no OO un 2. iespeja ir vienîgâ. Atseviðíi 
 ðis lîdzeklis un vârdnîcas ir iegûstams tîmekïa vietnç
 
  http://wiki.services.openoffice.org/wiki/Dictionaries


 Ar to moduïu uzstâdîðana praktiski ir pabeigta; atliek vienîgi caur 
 Options>Language settings>Writing aids ieslçgt vai izslçgt nepiecieðamos moduïus un 
 iestatît dokumentu noklusçto valodu.
 

 Ja ir nepiecieðama automâtiskâ pareizrakstîbas pârbaude, zem Tools>Spellcheck jâieíeksç 
 AutoSpellcheck.
 

3. Interesentiem

Ja jums ir iekrâjuðies vârdi, kurus ðis lîdzeklis neatpazîst vai arî atpazîst kïûdaini, esat
laipni aicinâti tos atsûtît tâlâkai vârdnîcas pilnveidoðanai vai arî reìistrçties vârdnîcas 
izstrâdei veltîtajâ vietnç //dict.dv.lv.

Lielâka apjoma dokumentu filtrçðanai var izmantot sekojoðâ vietâ atrodamu StarBasic makrosu:
http://lingucomponent.openoffice.org/servlets/ReadMsg?listName=dev&msgNo=1843

Piezîme - makross nedarbojas ar OO >3.0.

Sarakstu gadîjumâ ir lûgums sâkumâ paðiem kritiski izvçrtçt neatpazîto vârdu pareizîbu 
vai to pielietojamîbu (piem slengs, barbarismi utml. drazas, manuprât, nav tâ vçrtas, 
lai tâs iekïautu pareizrakstîbas pârbaudes vârdnîcâ, lai gan viena otra tomçr iespraucas).

4. Izmaiòu saraksts
=================
Version info 0.9.1
- papildinâts SFX x ar iztrûkstoðiem nosacîjumiem;
- atbilstoði tam mainîta un tîrîta vârdu bâze;
- papildinâts vârdu krâjums;
- aizvâkti vairâki kïûdainie ieraksti;
=================
Version info 0.9.0
- izveidots jauns afikss, kas SFX x, kas atbild par sievieðu dzimtes vârdu veidoðanu no 
  vîrieðu dzimtes vârdiem (skolnieks->skolniece utml);
- attiecîgi mainîta vârdu bâze, pie viena izmetot vairâkus gramatiski pareizus, taèu idiotiska satura ierakstus;
- papildinâts vârdu krâjums;
==================
Version info 0.8.2
-kosmçtiskas izmaiòas vârdu bâzç;
-labots afiksu fails (kïûda, kuras dçï III konj. darbîbas vârdiem ar galotni ît nebija 
  -oðs divdabja formu);
=================
Version info 0.8.1
-lielâkas nekâ sâkotnçji domâts izmaiòas vârdu bâzç;
-aizvâktas daþas atvasinâtâs vârdu formas, kuras "nenes" pielietojamu jçgu;
=================
Version info 0.8b1
!!! versija uzskatâma par pre-release
-bûtiskas izmaiòas aff failâ, tâlab arî leciens versiju numerâcija;
-papildinâjumi vârdu bâzç;
-aizvâktas daþas atvasinâtâs vârdu formas, kuras "nenes" pielietojamu jçgu;
=================
Version info 0.7.4
-labots afiksu fails - kïûdas pçc diviem afiksiem bija vienâdas atslçgas (tas
 (laimîgâ kârtâ, ðíiet, neietekmçja vârdnîcas darbaspçjas);
-ar roku filtrçti îpaðîbas vârdu krâjumi;
-papildinâts vârdu krâjums
=================
Version info 0.7.3
- labots II deklinâcijas afikss (papildinâts ar nnis-òòi)
- bûtiski papildinâts vârdu krâjums;
- novçrstas nepilnîbas vârdu locîjumos;
- izíertas daþas kïûdas vârdu krâjumâ.

Version info 0.7.2
- papildinâts vârdu krâjums;
- novçrstas nepilnîbas vârdu locîjumos
===================

Version info 0.7.1
- korekcijas îpaðîbas vârdu pârâko pakâpju afiksos;
- papildinâts vârdu krâjums;
- novçrstas nepilnîbas atseviðíu vârdu locîjumos
=================
... te daþus ir aizmirsies ierakstît...
=================
Version info 0.6.4
- bûtiskas izmaiòas daþos afiksos, kuru dçï notika tâ, kâ notika
- izfiltrçts un pârbaudîts dic fails

=================

Version info 0.6.3c
- daþi labojumi aff failâ
- papildinâts dic fails

=================

Version info 0.6.3a
- izlabots aff fails (neuzmanîbas kïûda, kas, iespçjams, neatstâja ietekmi uz
  darbîbu
- papildinâts dic fails

=================
 
Version info 0.6.3
- izlaboti un optimizçti daþi afiksi;
- manuâli izfiltrçts vârdu pamatformu krâjums, tuvinot reâlai dzîvei;
- koplektâ iekïauts arî Jâòa Vilima izstrâdâtais vârdu pârnesçjs v. 0.2 (skat. hyph-lasimani.txt);

Vârdnîcâ joprojâm iztrûkst ðis un tas, tâpçc visi ir mîïi aicinâti sûtît neatpazîtos vârdus man (adrese - skat augðâ) vai ierosinâjumus par pârnesçju - Jânim Vilimam.

Turpmâkajos plânos ietilpst vârdnîcas papildinâðana un, iespçjams, darbîbas vârdu afiksu pârstrâde, ja eksperimenti apstiprinâs aizdomas par kïûdâm.

=================
Version info 0.6
- pilnîgi pârveidota afiksu faila struktûra, sadalot locîjumus
  pa skaitïiem un pamazinâmâm formâm ar nolûku uzlabot pareizo
  (dzîvç pielietojamo) formu kodçðanu. Ir izdarîti arî vairâki
  afiksu labojumi.


Vârdnîcâ 0.6 joprojâm nav atrodami:
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- I konjugâcijas darbîbas vârdu refleksîvâs formas
- I konjugâcijas darbîbas vârdu divdabju sufiksi - oðs oðais ams amais
- I konjugâcijas darbîbas vârdu divdabju sufiksi - is dams damais
- lietvârdi-daudzskaitlinieki

Visi, kas lieto ðo "brînumu", ir laipni aicinâti sûtît man neatpazîto
vârdu sarakstus (txt vai swx formâtos). 
Visideâlâkâ forma - neatpazîtais vârds visos tam raksturîgajos locîjumos.

Entuziasti var nodarboties arîdzan ar specializçto vârdnîcu veidoðanu, 
kuras var pieslçgt lietoðanai OpenOffice paralçli pamatvârdnîcai.

=================
Verson info 0.5.5
- pievienota visa 1. konjugâcija....
- lietvârdu pamazinâmo formu afiksi

Vârdnîcâ 0.5.5 nav atrodami:
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- lietvârdi-daudzskaitlinieki
- vçl ðis un tas

Verson info 0.5sr2
- pievienoti 1. konjugâcijas darbîbas vârdû nâkotnes formas

Vârdnîcâ 0.5sr2 nav atrodami:
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- lietvârdi-daudzskaitlinieki
- vçl ðis un tas (piem. pamazinâmâs formas)

Verson info 0.5
- pievienota divdabju veidoðana un locîðana
- izlabota kïûda I deklinâcijas locîðanâ (piem. kuìis)
- izlabota kïûda V deklinâcijas locîðanâ (piem. roze)
- papildinâta vârdnîca (nedaudz)

Vârdnîcâ 0.5 nav atrodami:
- 1. konjugâcijas darbîbas vârdi
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- lietvârdi-daudzskaitlinieki
- vçl ðis un tas (piem. pamazinâmâs formas)

Version info 0.4.1
- izlabots glucks I deklinâcijas lietvârdu locîðanâ
- pievienoti skaitïa vârdi

Vârdnîcâ nav atrodami:
- 1. konjugâcijas darbîbas vârdi
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- lietvârdi-daudzskaitlinieki
- divdabji, 
- vçl ðis un tas


Version info: 0.4
-koriìçtas 1. un 4. deklinâcija lietvârdu vârdnîcas
-ieviesti afiksi îpaðîbas vârdiem
-pievienoti apstâkïa vârdi un îpaðîbas vârdi

Vârdnîcâ nav atrodami:
- 1. konjugâcijas darbîbas vârdi
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- lietvârdi-daudzskaitlinieki
- divdabji, 
- skaitïa vârdi
- vçl ðis un tas


Version info: 0.3.1
-izlabots fails .dic, II deklinâcijas atslçga (suns, akmens)
-pievienoti 1. un 6. deklinâcijas lietvârdi

Vârdnîcâ nav atrodami:
- 1. konjugâcijas darbîbas vârdi
- îpaðîbas vârdi, divdabji, apstâkïa vârdi, 
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- skaitïa vârdi
- vçl ðis un tas


Version info: 0.3

Vârdnîcâ nav atrodami:
- 1. un 6. deklinâcijas lietvârdi
- 1. konjugâcijas darbîbas vârdi
- îpaðîbas vârdi, divdabji, apstâkïa vârdi, 
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- skaitïa vârdi
- vçl ðis un tas

Version info: 0.3a
izlabots fails .dic, kurâ bija zuduðas atslçgas IV deklinâcijai

Version info: 0.3

Vârdnîcâ nav atrodami:
- 1. un 6. deklinâcijas lietvârdi
- 1. konjugâcijas darbîbas vârdi
- îpaðîbas vârdi, divdabji, apstâkïa vârdi, 
- darbîbas vârdi, kuri eksistç tikai refleksîvajâs formâs
- skaitïa vârdi
- vçl ðis un tas
