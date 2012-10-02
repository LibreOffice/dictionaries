# Latvie�u valodas pareizrakst�bas p�rbaudes bibliot�ka (afiksu un v�rdn�cas fails) 
# lieto�anai ar OpenOffice 2.4.x un augst�k
# Latvian spelling dictionary (affix and dictionary files) for OpenOffice 2.4.x and higher
#
# Copyright (C) 2002-2010 Janis Eisaks, jancs@dv.lv, http://dict.dv.lv
# 
# �� bibliot�ka tiek licenc�ta ar Lesser General Public Licence (LGPL) 2.1 nosac�jumiem. 
# Licences nosac�jumi pievienoti fail� license.txt vai ieg�stami t�mek�a vietn�  
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
2. Uzst�d��ana
3. Interesentiem
4. Izmai�u saraksts

==================
1. Version info 0.9.3
Svar�gs pazi�ojums: 
�� ir p�d�j� v�rdn�cas versija, kas ir 100% MySpell savietojama. 
Ar n�ko�o laidienu tiks uzs�kta HunSpell funkcionalit�tes ievie�ana.

Izmai�as �aj� vesij�:
- kori��ts SFX 6 - aizv�kts viens lieks (atk�rtots) likums;
- papildin�ts SFX 3 ar likumu pav�les formas veido�anai;
- papildin�ts SFX 4 ar likumiem piem., v�rdu lemt, riet, siet, cirst,  pag�tnes formu veido�anai;
- papildin�ts SFX 5 ar afiksiem v�rdu r�t, v�t apg�tnes formu ieg��anai;
- papildin�ts SFX 7 ar afiksiem I konj. da�as 2. un 3. grupas v�rdu tagadnes formu ieg��anai;
- papildin�ts SFX 8 ar afiksiem v�rdu cept, nest, �emt tagadnes formu ieg��anai;
- main�ti afiksi 2 un E;
- papildin�ts v�rdu kr�jums;
- veikta padzi�in�ta v�rdn�cas p�rbaude, lai aizv�ktu atk�rtojumus, k��das;

Zin�m�s probl�mas (k� jau parasti):
- iztr�ksto�i v�rdi vai to atsevi��as formas, kuras lietot�ji ir laipni aicin�ti ies�t�t
  uz adresi dict@nospam@dv.lv (no adreses j�dz�� @nospam) vai, kam b�tu dodama priek�roka, 
  ar vietnes http://dict.dv.lv starpniec�bu darba turpin��anai.

=================

2. V�rd�cas uzst�d��ana

Ieteikums: uzst�d�t vismaz OO 3.2 versiju.
V�rdn�cas uzst�d��ana ir �oti vienk�r�a - izmantojot OO Extension Manager.
Extension Manager pied�v� iesp�ju k� tie�saistes, t� lok�lu papla�in�jumu uzst�d��anu.
Ja uzst�d��ana tie�saistes re��m� nav iesp�jama, vajadz�go valodas papla�in�jumu (v�rdn�cu)
var lejupiel�d�t �eit:

http://extensions.services.openoffice.org/dictionary

un izmantot lok�lai uzst�d��anai.

Ja izmantojat OO versiju, kas neuztur Extensions (pirms 2.4.1), tad:

1. iesp�ja. Uzst�d��ana tie�saistes re��m�
 No izv�lnes File/Wizards/Install new dictionaries palaidiet att. vedni, izv�lieties 
 Jums t�kamo ved�a valodu un sekojiet nor�d�jumiem. Bez latvie�u valodas pareizrakst�bas 
 r�kiem J�s vienlaic�gi varat uzst�d�t papildus valodas vai atsvaidzin�t eso��s bibliot�kas.
 (Uzman�bu! - nav zin�ms, cik ilgi �� bibliot�ka v�l tiks aktualiz�ta; pilns laidienu arh�vs ir 
  atrodams http://sourceforge.net/projects/openoffice-lv/)

 Ja kaut k�du iemeslu d�� nevarat izmantot 1. iesp�ju, ir
 
 2. iesp�ja. "Offline" uzst�d��ana
 Lejupiel�d�jiet p�d�jo modu�a versiju no openoffice-lv.sourceforge.net .
 P�c faila ieg��anas tas ir j�atpako direktorij� %Openoffice%\share\dict\ooo, 
 kur %Openoffice% - direktorija, kur� veikta OpenOffice uzst�d��ana. Tur eso�ajam failam 
 dictionary.lst ir j�pievieno sekojo�as rindas: 
 
 DICT lv LV lv_LV
 HYPH lv LV hyph_lv_LV

 vai ar� j�izpilda win-lv_LV_add.bat (Windows gad�jum�) vai, Linux gd�jum�, j�izpilda 
 komandu:

   sh <lin-lv_LV_add.sh

 Lai izpild�tu 2. iesp�ju, Jums ir j�b�t ties�b�m rakst�t min�taj� katalog�. Ja t�du nav, 
 varat uzst�d�t v�rdn�cu lok�li, sav� lietot�ja opciju katalog� (%OOopt%/user/wordbook).

 Offline uzstad��anai var izmantot ar� 1. iesp�j� min�to vedni, viss notiks l�dz�gi, 
 tikai nepiecie�amaj�m modu�u pakotn�m b�s j�b�t uz lok�l� diska. J�piez�m� ka, piem�ram, 
 SUSE gad�jum� min�tais vednis ir izgriezts �r� no OO un 2. iespeja ir vien�g�. Atsevi��i 
 �is l�dzeklis un v�rdn�cas ir ieg�stams t�mek�a vietn�
 
  http://wiki.services.openoffice.org/wiki/Dictionaries


 Ar to modu�u uzst�d��ana praktiski ir pabeigta; atliek vien�gi caur 
 Options>Language settings>Writing aids iesl�gt vai izsl�gt nepiecie�amos modu�us un 
 iestat�t dokumentu noklus�to valodu.
 

 Ja ir nepiecie�ama autom�tisk� pareizrakst�bas p�rbaude, zem Tools>Spellcheck j�ie�eks� 
 AutoSpellcheck.
 

3. Interesentiem

Ja jums ir iekr�ju�ies v�rdi, kurus �is l�dzeklis neatpaz�st vai ar� atpaz�st k��daini, esat
laipni aicin�ti tos ats�t�t t�l�kai v�rdn�cas pilnveido�anai vai ar� re�istr�ties v�rdn�cas 
izstr�dei velt�taj� vietn� //dict.dv.lv.

Liel�ka apjoma dokumentu filtr��anai var izmantot sekojo�� viet� atrodamu StarBasic makrosu:
http://lingucomponent.openoffice.org/servlets/ReadMsg?listName=dev&msgNo=1843

Piez�me - makross nedarbojas ar OO >3.0.

Sarakstu gad�jum� ir l�gums s�kum� pa�iem kritiski izv�rt�t neatpaz�to v�rdu pareiz�bu 
vai to pielietojam�bu (piem slengs, barbarismi utml. drazas, manupr�t, nav t� v�rtas, 
lai t�s iek�autu pareizrakst�bas p�rbaudes v�rdn�c�, lai gan viena otra tom�r iespraucas).

4. Izmai�u saraksts
=================
Version info 0.9.1
- papildin�ts SFX x ar iztr�ksto�iem nosac�jumiem;
- atbilsto�i tam main�ta un t�r�ta v�rdu b�ze;
- papildin�ts v�rdu kr�jums;
- aizv�kti vair�ki k��dainie ieraksti;
=================
Version info 0.9.0
- izveidots jauns afikss, kas SFX x, kas atbild par sievie�u dzimtes v�rdu veido�anu no 
  v�rie�u dzimtes v�rdiem (skolnieks->skolniece utml);
- attiec�gi main�ta v�rdu b�ze, pie viena izmetot vair�kus gramatiski pareizus, ta�u idiotiska satura ierakstus;
- papildin�ts v�rdu kr�jums;
==================
Version info 0.8.2
-kosm�tiskas izmai�as v�rdu b�z�;
-labots afiksu fails (k��da, kuras d�� III konj. darb�bas v�rdiem ar galotni �t nebija 
  -o�s divdabja formu);
=================
Version info 0.8.1
-liel�kas nek� s�kotn�ji dom�ts izmai�as v�rdu b�z�;
-aizv�ktas da�as atvasin�t�s v�rdu formas, kuras "nenes" pielietojamu j�gu;
=================
Version info 0.8b1
!!! versija uzskat�ma par pre-release
-b�tiskas izmai�as aff fail�, t�lab ar� leciens versiju numer�cija;
-papildin�jumi v�rdu b�z�;
-aizv�ktas da�as atvasin�t�s v�rdu formas, kuras "nenes" pielietojamu j�gu;
=================
Version info 0.7.4
-labots afiksu fails - k��das p�c diviem afiksiem bija vien�das atsl�gas (tas
 (laim�g� k�rt�, ��iet, neietekm�ja v�rdn�cas darbasp�jas);
-ar roku filtr�ti �pa��bas v�rdu kr�jumi;
-papildin�ts v�rdu kr�jums
=================
Version info 0.7.3
- labots II deklin�cijas afikss (papildin�ts ar nnis-��i)
- b�tiski papildin�ts v�rdu kr�jums;
- nov�rstas nepiln�bas v�rdu loc�jumos;
- iz�ertas da�as k��das v�rdu kr�jum�.

Version info 0.7.2
- papildin�ts v�rdu kr�jums;
- nov�rstas nepiln�bas v�rdu loc�jumos
===================

Version info 0.7.1
- korekcijas �pa��bas v�rdu p�r�ko pak�pju afiksos;
- papildin�ts v�rdu kr�jums;
- nov�rstas nepiln�bas atsevi��u v�rdu loc�jumos
=================
... te da�us ir aizmirsies ierakst�t...
=================
Version info 0.6.4
- b�tiskas izmai�as da�os afiksos, kuru d�� notika t�, k� notika
- izfiltr�ts un p�rbaud�ts dic fails

=================

Version info 0.6.3c
- da�i labojumi aff fail�
- papildin�ts dic fails

=================

Version info 0.6.3a
- izlabots aff fails (neuzman�bas k��da, kas, iesp�jams, neatst�ja ietekmi uz
  darb�bu
- papildin�ts dic fails

=================
 
Version info 0.6.3
- izlaboti un optimiz�ti da�i afiksi;
- manu�li izfiltr�ts v�rdu pamatformu kr�jums, tuvinot re�lai dz�vei;
- koplekt� iek�auts ar� J��a Vilima izstr�d�tais v�rdu p�rnes�js v. 0.2 (skat. hyph-lasimani.txt);

V�rdn�c� joproj�m iztr�kst �is un tas, t�p�c visi ir m��i aicin�ti s�t�t neatpaz�tos v�rdus man (adrese - skat aug��) vai ierosin�jumus par p�rnes�ju - J�nim Vilimam.

Turpm�kajos pl�nos ietilpst v�rdn�cas papildin��ana un, iesp�jams, darb�bas v�rdu afiksu p�rstr�de, ja eksperimenti apstiprin�s aizdomas par k��d�m.

=================
Version info 0.6
- piln�gi p�rveidota afiksu faila strukt�ra, sadalot loc�jumus
  pa skait�iem un pamazin�m�m form�m ar nol�ku uzlabot pareizo
  (dz�v� pielietojamo) formu kod��anu. Ir izdar�ti ar� vair�ki
  afiksu labojumi.


V�rdn�c� 0.6 joproj�m nav atrodami:
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- I konjug�cijas darb�bas v�rdu refleks�v�s formas
- I konjug�cijas darb�bas v�rdu divdabju sufiksi - o�s o�ais ams amais
- I konjug�cijas darb�bas v�rdu divdabju sufiksi - is dams damais
- lietv�rdi-daudzskaitlinieki

Visi, kas lieto �o "br�numu", ir laipni aicin�ti s�t�t man neatpaz�to
v�rdu sarakstus (txt vai swx form�tos). 
Viside�l�k� forma - neatpaz�tais v�rds visos tam rakstur�gajos loc�jumos.

Entuziasti var nodarboties ar�dzan ar specializ�to v�rdn�cu veido�anu, 
kuras var piesl�gt lieto�anai OpenOffice paral�li pamatv�rdn�cai.

=================
Verson info 0.5.5
- pievienota visa 1. konjug�cija....
- lietv�rdu pamazin�mo formu afiksi

V�rdn�c� 0.5.5 nav atrodami:
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- lietv�rdi-daudzskaitlinieki
- v�l �is un tas

Verson info 0.5sr2
- pievienoti 1. konjug�cijas darb�bas v�rd� n�kotnes formas

V�rdn�c� 0.5sr2 nav atrodami:
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- lietv�rdi-daudzskaitlinieki
- v�l �is un tas (piem. pamazin�m�s formas)

Verson info 0.5
- pievienota divdabju veido�ana un loc��ana
- izlabota k��da I deklin�cijas loc��an� (piem. ku�is)
- izlabota k��da V deklin�cijas loc��an� (piem. roze)
- papildin�ta v�rdn�ca (nedaudz)

V�rdn�c� 0.5 nav atrodami:
- 1. konjug�cijas darb�bas v�rdi
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- lietv�rdi-daudzskaitlinieki
- v�l �is un tas (piem. pamazin�m�s formas)

Version info 0.4.1
- izlabots glucks I deklin�cijas lietv�rdu loc��an�
- pievienoti skait�a v�rdi

V�rdn�c� nav atrodami:
- 1. konjug�cijas darb�bas v�rdi
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- lietv�rdi-daudzskaitlinieki
- divdabji, 
- v�l �is un tas


Version info: 0.4
-kori��tas 1. un 4. deklin�cija lietv�rdu v�rdn�cas
-ieviesti afiksi �pa��bas v�rdiem
-pievienoti apst�k�a v�rdi un �pa��bas v�rdi

V�rdn�c� nav atrodami:
- 1. konjug�cijas darb�bas v�rdi
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- lietv�rdi-daudzskaitlinieki
- divdabji, 
- skait�a v�rdi
- v�l �is un tas


Version info: 0.3.1
-izlabots fails .dic, II deklin�cijas atsl�ga (suns, akmens)
-pievienoti 1. un 6. deklin�cijas lietv�rdi

V�rdn�c� nav atrodami:
- 1. konjug�cijas darb�bas v�rdi
- �pa��bas v�rdi, divdabji, apst�k�a v�rdi, 
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- skait�a v�rdi
- v�l �is un tas


Version info: 0.3

V�rdn�c� nav atrodami:
- 1. un 6. deklin�cijas lietv�rdi
- 1. konjug�cijas darb�bas v�rdi
- �pa��bas v�rdi, divdabji, apst�k�a v�rdi, 
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- skait�a v�rdi
- v�l �is un tas

Version info: 0.3a
izlabots fails .dic, kur� bija zudu�as atsl�gas IV deklin�cijai

Version info: 0.3

V�rdn�c� nav atrodami:
- 1. un 6. deklin�cijas lietv�rdi
- 1. konjug�cijas darb�bas v�rdi
- �pa��bas v�rdi, divdabji, apst�k�a v�rdi, 
- darb�bas v�rdi, kuri eksist� tikai refleks�vaj�s form�s
- skait�a v�rdi
- v�l �is un tas
