For English Readers: please see the text at the end of this document

--- Italiano ---

Dizionario Italiano versione 1.8 (2003-01-22)

SOMMARIO

1. Licenza
2. Avvertenze importanti (leggere assolutamente)
3. Modalità  d'installazione in OpenOffice.org
4. Integrazione con Mozilla 1.0 e superiori.
5. Ringraziamenti

1. Licenza

Il file affix e il dizionario italiano per il correttore ortografico MySpell/OpenOffice.org sono rilasciati dagli autori, Gianluca Turconi <luctur@openoffice.org> e Davide Prina <davideprina@yahoo.com> sotto i termini e le condizioni della GNU General Public License (GPL) e della GNU Lesser General Public License (LGPL). L'utente, il distributore e il modificatore di questi files hanno una opzione di scelta tra le due licenze. Una volta effettuata la scelta per l'uso, la distribuzione e la modifica, l'accettante dovrà rispettare tutti i termini e le condizioni riportate nella licenza prescelta.

2. Avvertenze importanti (leggere assolutamente)

A partire dalla build 641d della Suite OpenOffice.org è stato modificato un importante componente che si occupa del trattamento delle parole contenenti l'elisione (il comune apostrofo). Mentre in precedenza il correttore ortografico accettava qualunque parola precedesse e seguisse l'elisione purché fosse contenuta nel dizionario, attualmente, solo le parole che nel loro complesso sono presenti nel dizionario saranno considerate corrette.

In lingue come l'italiano che fanno un larghissimo uso dell'elisione, ciò ha comportato la necessità  di modificare profondamente sia le regole grammaticali utilizzate sia il dizionario stesso. La presente versione è perciò ASSOLUTAMENTE necessaria a partire dalla versione 641d e superiori. La compatibilità con versioni precedenti è comunque garantita.

Data la profonda trasformazione del dizionario è possibile la presenza di errori o il mancato riconoscimento di alcuni vocaboli. In questi casi è sufficiente cliccare col tasto destro sulla parola interessata per far comparire il menù di contesto per l'aggiunta del vocabolo in questione ad un dizionario personalizzato. E' però importante che i vocaboli non riconosciuti vengano segnalati inviando un messaggio a <luctur@openoffice.org>, in modo che si possano integrare correttamente nelle versioni successive del dizionario. Sarà sufficiente inviare il vostro dizionario custom.dic o altro dizionario personalizzato creato da voi.

3. Modalità  d'installazione (procedura corretta a partire dalla version 641c).

Esistono principalmente due modalità per installare il dizionario italiano :

a) in automatico, grazie a due comodi installer creati da membri della comunità che si occupano di tutte le fasi dell'installazione.

La versione per MS Windows si trova su 

http://www.ooodocs.org/dictinstall/

Mentre la versione per Linux è reperibile presso

http://www.deadletterdrop.worldonline.co.uk/OOo/

oppure

http://ooodi.sourceforge.net/

b) manualmente
Scompattate il file compresso (.zip, tar.gz, bzip,...) nella directory/cartella : <Directory di installazione di OpenOffice.org>/user/wordbook/

Attenzione: a partire dalla versione 1.0.1 di OpenOffice.org, il percorso per l'installazione dei dizionari localizzati è stato modificato in: <Directory di installazione di OpenOffice.org>/share/dict/ooo

Aprite in un qualsiasi editor di testo il file dictionary.lst che troverete nella cartella citata precedentemente, in modo da poter inserire il codice della lingua e della regione che vi interessa. 

Per esempio: 
nel vostro editor di testo aggiungete questa linea al file dictionary.lst:

DICT it IT it_IT 

Quindi salvate il file con le vostre modifiche. I significati dei vari campi sono:

Campo 1: Tipo di stringa: "DICT" , al momento è l'unica voce disponibile.
Campo 2: Codice linguistico "it" o "de" o "en" ... (vedi Codici Linguistici ISO)
Campo 3: Codice Regionale "IT" o"DE" o "US" ... (vedi Codici Regionali ISO)
Campo 4: Il nome del dizionario da utilizzare "it_IT" o "it_CH" o ... (senza aggiungere le estensioni .aff o .dic dei files. Questa voce è particolarmente utile se vogliamo creare i nostri dizionari specializzati. Per esempio it_INFORMATICA o it_DIRITTO. Sarà sufficiente aggiungere un'altra linea al file dictionary.lst cambiando solo il nome del dizionario e il correttore ortografico di OpenOffice.org controllerà i vostri documenti usando in successione tutti i dizionari elencati e presenti nella cartella wordbook per la lingua italiana).

Successivamente :

1) Aprite un nuovo documento di OpenOffice.org e scegliete dalla barra dei menù il comando:
Strumenti->Opzioni->Impostazioni Lingua->Lingue (Tools->Options->Language settings->Languages nella versione inglese)
2) Impostate nell'elenco a discesa che vedete sulla destra la lingua italiana quale linguaggio di default per i vostri documenti
3)selezionando l'elemento Linguistica (Writing Aids)che troverete nella sezione Impostazioni Lingua (Language Settings) e premendo il tasto di modifica della sezione Moduli Linguistici Disponibili (Available language modules) collocato sulla destra della finestra di dialogo, potrete accedere alla sezione che vi permetterà di impostare il correttore in italiano. Sarà sufficiente scegliere la nostra lingua dall'elenco a discesa che mostra tutti i dizionari disponibili nella Suite, facendo attenzione a selezionare con un segno di spunta, la funzione di correzione ortografica nel riquadro immediatamente sottostante l'elenco a discesa.

Attenzione: La denominazione dei comandi di menù o delle finestre può subire un cambiamento o la loro collocazione può essere modificata nel passaggio da una versione ad un'altra. 

Attenzione: gli utenti di OpenOffice.org per MS Windows, devono riavviare anche il quickstarter della Suite, la piccola icona con i gabbiani (versione 1.0) che dovrebbe apparire sulla System Tray nell'angolo in basso a destra dello schermo, proprio a fianco dell'orologio di sistema. E' sufficiente cliccare col tasto destro del mouse sull'icona e scegliere esci o exit dal menù di contesto. Successivamente, si dovrà effettuare l'installazione del dizionario, mantenendo disattivato il quickstarter durante tutta la procedura, chiudere il documento dal quale si sono modificate le opzioni generali e riaprirne uno nuovo per verificare il funzionamento del correttore italiano. 

Questo è tutto, il correttore ortografico in italiano dovrebbe funzionare in modo adeguato.

4. Integrazione con Mozilla 1.0 e superiori.

Questo dizionario può essere integrato nel correttore ortografico del browser Mozilla 1.0 e superiori (http://www.mozilla.org/). Il correttore ortografico può essere reperito nel progetto Moz spellchecker ospitato su http://www.mozdev.org/

5. Ringraziamenti (aggiornato al 12 Aprile 2003)

Gli utenti di un elaboratore di testi, come di qualunque altra applicazione software che utilizzi un correttore ortografico, spesso sottovalutano il lavoro necessario per produrre questo strumento fondamentale. I problemi sono molti: la lingua italiana non è statica, ma in continua evoluzione; semplici errori di digitazione in un dizionario digitale possono portare a gravi conseguenze sul funzionamento del correttore; ciò che si usa correntemente nella lingua parlata non sempre è corretto in quella scritta.

Proprio per ovviare a tali difficoltà, i volontari della Comunità OpenOffice.org hanno partecipato attivamente al controllo di qualità del contenuto dell'attuale dizionario per la correzione ortografica. Con questa sezione si vuole rendere merito a tutti coloro che hanno collaborato in questa attività.

Il più meritevole

Riccardo Caverni.

Motivazione: nonostante tutti abbiano contribuito con prontezza e precisione, Riccardo alla data in cui questa sezione viene scritta ha contribuito col controllo di più di 2000 vocaboli, senza dimenticare il lavoro impegnativo finale sui controlli effettuati da altri volontari. Un vero esempio di serietà e partecipazione.

Menzione Speciale

Edgardo Lugaresi, Marco Ciacci

Motivazione: Precisi e attenti nelle correzioni, hanno effettuato più di 1000 controlli, dimostrandosi sempre disponibili a collaborare per il miglioramento del correttore ortografico.

Gli altri volontari partecipanti ai controlli sul dizionario OpenOffice.org

Fabio Bossi aka bioFa, Claudio Rampini, Elisa Calcagni, Ugo Bresolin, Giuseppe Lettieri aka Peterpunk, Claudia Ginocchio, Giuseppe Santo Barile, Pierluigi Andreoli, Daniele Vazzola aka Vazzo, Marco Spigolon, Mr Coke, Silvio Bacchetta, Stefano Dal Pra, Giacomo Magnini, Giuseppe Delli Santi, Giuseppe Garzotto aka double-g, Marco Menardi, Alberto (Fsug-Venezia), Riccardo Furlan (Fsug-Venezia), Mike, Isaac, Andrea Dieni aka daigo, Andrea Spitaleri, Joram, Paolo Bolettieri, Paolo Finetti, Umberto Bertolini, Roberta Annoni, Gianmaria Visconti

NOTA: L'ordine di elencazione dei volontari menzionati è legato al numero di controlli effettuati.

--- English ---

This version 1.7 (2003-01-22) is ABSOLUTELY necessary for OpenOffice.org 641d and greater.

The Italian dictionary and affix file for the MySpell/OpenOffice.org spell-checker are released by the authors Gianluca Turconi <luctur@openoffice.org> and Davide Prina <davideprina@yahoo.com> under the terms and conditions of the GNU General Public License (GPL) or GNU Lesser General Public License. The user, distributor and/or programmer has the option to choose between GPL and LGPL terms and conditions whe he/she uses, distributes and/or modifies these files. Once the choice has been made, he/she must agree with every term and condition included in the chosen license.

How to install the dictionary:

1.	To install these dictionaries in OOo build 641c and greater:
  A.	Unzip the dictionary files, *.aff and *.dic, 
		into your <OpenOffice.org>\user\wordbook\*.*  directory

Attention: since OpenOffice.org 1.0.1 the right folder for the dicionary is <OpenOffice.org>\share\dict\ooo

  B.	Edit the dictionary.lst file that is in that same directory 
		using any text editor to register a dictionary for a specific 
		locale (the same dictionary can be registered for multiple locales).

For example: 
To add the it_IT.zip dictionary under the Italian (Italy) locale to OOo you would:
cd <OpenOffice.org641>\user\wordbook (or <OpenOffice.org>\share\dict\ooo)
unzip it_IT.zip  


2.		And then, using any text editor, add the following line to dictionary.lst:
		DICT it IT it_IT

This line tells OOo to register the affix file it_IT.aff and the wordlist it_IT.dic 
to the locale it IT, which is Italian (Italy). The specific fields of this line are:

Field 1: Entry Type "DICT" is the only supported entry type so far
Field 2: Language code from Locale "en" or "it" or "pt" ...
				(see {ISO Language Code} page)
Field 3: Country code from Locale "IT"  ... 
				(see {ISO Country Code} page)
Field 4: Root name of Dictionary "italian" or "it_it"  ... 
				(do not add the .aff or .dic extensions to the name)


3. Start up OpenOffice.org. and go to:

Tools->Options->LanguageSettings->WritingAids

Hit "Edit" and use the pull down menu to select your locale, Italy, 
and then make sure to check the MySpell SpellChecker for that locale. 

That it! Your dictionary is installed and registered for that language.

4. Thanks (Last updated: April, 12 2003)

The users of a word processor, like of whatever application that utilizes a spell checker, often underestimate the work needed to produce this basic tool. There are a lot of problems: the Italian language is not static, but always evolving; simple misspelled words in a digital dictionary can cause several problems to the spell checker; what is commonly used in the spoken language, it is not always right in the written one.

Just to overcome such difficulties, the volunteers of the OpenOffice.org Community have actively took part into the quality check of this dictionary content. With this section, we want to give the right credit to all people who have collaborated in this activity.

The Most Outstanding Volunteer

Riccardo Caverni.

Motivation: though everybody contributed at his/her best, Riccardo, until the date in which this document has been written, contributed by checking the meaning of more than 2000 words, without forgetting the hard final work for this version release. A real example for seriousness and participation.

Special Mention

Edgardo Lugaresi, Marco Ciacci

Motivation: they are always careful in their corrections and have checked the meaning of more than 1000 words by showing their will to collaborate to the improvement of the spell checker.

Other volunteers who have helped to check the Italian OpenOffice.org dictionary.

Fabio Bossi aka bioFa, Claudio Rampini, Elisa Calcagni, Ugo Bresolin, Giuseppe Lettieri aka Peterpunk, Claudia Ginocchio, Giuseppe Santo Barile, Pierluigi Andreoli, Daniele Vazzola aka Vazzo, Marco Spigolon, Mr Coke, Silvio Bacchetta, Stefano Dal Pra, Giacomo Magnini, Giuseppe Delli Santi, Giuseppe Garzotto aka double-g, Marco Menardi, Alberto (Fsug-Venezia), Riccardo Furlan (Fsug-Venezia), Mike, Isaac, Andrea Dieni aka daigo, Andrea Spitaleri, Joram, Paolo Bolettieri, Paolo Finetti, Umberto Bertolini, Roberta Annoni, Gianmaria Visconti

NOTE: The listing order of the volunteers is related to their contribution.
