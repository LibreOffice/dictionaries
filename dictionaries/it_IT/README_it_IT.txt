For English Readers: please see the text at the end of this document

--- Italiano ---

Dizionario Italiano versione 1.9 (2003-08-01)

SOMMARIO

1. Licenza
2. Avvertenze importanti (leggere assolutamente)
3. Modalità  d'installazione in OpenOffice.org
4. Integrazione con Mozilla 1.0 e superiori.
5. Ringraziamenti

1. Licenza

Il file affix e il dizionario italiano per il correttore ortografico MySpell/OpenOffice.org sono rilasciati dagli autori, Gianluca Turconi <luctur@openoffice.org> e Davide Prina <davideprina@yahoo.com> sotto i termini e le condizioni della GNU General Public License (GPL) e della GNU Lesser General Public License (LGPL). L'utente, il distributore e il modificatore di questi files hanno una opzione di scelta tra le due licenze. Una volta effettuata la scelta per l'uso, la distribuzione e la modifica, l'accettante dovrà rispettare tutti i termini e le condizioni riportate nella licenza prescelta.

2. Avvertenze importanti (leggere assolutamente)

A partire da OpenOffice.org 1.1, il dizionario italiano per la correzione ortografica è direttamente integrato nella suite e perciò non necessita più di alcuna installazione manuale. E' opportuno verificare che il dizionario sia attivo, selezionando dalla barra dei menù Strumenti->Opzioni->Impostazione Lingua->Lingue e controllando che sotto lingue standard/Occidentale, l'opzione di scelta "Italiano (Italia)" sia selezionata e abbia al suo fianco un segno di spunta sormontato dalle lettere ABC.

Nel caso il correttore non risultasse attivo, è sufficiente scegliere dalla barra dei menù Strumenti->Opzioni->Impostazione Lingua->Linguistica e dopo avere cliccato sul pulsante "Modifica" della finestra di dialogo, attivarlo seleziondo l'apposita voce.

Se tuttavia il correttore non risultasse ancora attivo o nell'eventualità che si voglia aggiornare la versione del dizionario installata è possibile utilizzare le procedure di installazione indicate oltre.

3. Modalità d'installazione (procedura corretta a partire dalla version 641c).

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

5. Ringraziamenti (aggiornato al 20 Luglio 2003)

Gli utenti di un elaboratore di testi, come di qualunque altra applicazione software che utilizzi un correttore ortografico, spesso sottovalutano il lavoro necessario per produrre questo strumento fondamentale. I problemi sono molti: la lingua italiana non è statica, ma in continua evoluzione; semplici errori di digitazione in un dizionario digitale possono portare a gravi conseguenze sul funzionamento del correttore; ciò che si usa correntemente nella lingua parlata non sempre è corretto in quella scritta.

Proprio per ovviare a tali difficoltà, i volontari della Comunità OpenOffice.org hanno partecipato attivamente al controllo di qualità del contenuto dell'attuale dizionario per la correzione ortografica. Con questa sezione si vuole rendere merito a tutti coloro che hanno collaborato in questa attività.

I più meritevoli

Riccardo Caverni, Marco Saba aka Metropolinux

Motivazione: Entrambi hanno contribuito alla correzione di più di 4000 vocaboli, dedicando il loro tempo al Progetto senza restrinzioni o impedimenti, anche di carattere personale. Per queste ragioni hanno meritato la riconoscenza di tutta la Comunità.

Menzione Speciale

Edgardo Lugaresi, Marco Ciacci, Claudio Rampini, Elisa Calcagni, Carlo aka Cadfael, Giuseppe Delli Santi, Fabio Bossi aka bioFa, Giovanni Molteni

Motivazione: Precisi e attenti nelle correzioni, hanno effettuato più di 1000 controlli, dimostrandosi sempre disponibili a collaborare per il miglioramento del correttore ortografico.

Gli altri volontari partecipanti ai controlli sul dizionario OpenOffice.org

Ugo Bresolin, Carlo Facci, Silvio Bacchetta, Giuseppe Lettieri aka Peterpunk, Pierluigi Andreoli, Massimiliano Vessi, Giuseppe Santo Barile, Riccardo Furlan (Fsug-Venezia), Marco Menardi, Alex De Maria aka ADBlues, Claudia Ginocchio, Isaac (Fsug-Venezia), Andrea Spitaleri aka XspiriX, Mr. Crocodile, Joram, Daniele Vazzola aka Vazzo, Marco Spigolon, Mr Coke, Stefano Dal Pra, Giacomo Magnini, Giuseppe Garzotto aka double-g, Alberto (Fsug-Venezia), Mike, Andrea Dieni aka daigo, , Paolo Bolettieri, Paolo Finetti, Umberto Bertolini, Roberta Annoni, Gianmaria Visconti, Angelo Conforti aka angeloxx, Oliver Maurizio, Michele Bariani, Filippo Spanò Felipe, Mariangela Pansini, Galblait, Salvatore Comito aka Linuxino, Eugenio, Massimo, Rossella Diomede, Mauro Bonetti.

NOTA: L'ordine di elencazione dei volontari menzionati è legato al numero di controlli effettuati.

--- English ---

This version 1.9 (2003-08-1)

The Italian dictionary and affix file for the MySpell/OpenOffice.org spell-checker are released by the authors Gianluca Turconi <luctur@openoffice.org> and Davide Prina <davideprina@yahoo.com> under the terms and conditions of the GNU General Public License (GPL) or GNU Lesser General Public License. The user, distributor and/or programmer has the option to choose between GPL and LGPL terms and conditions whe he/she uses, distributes and/or modifies these files. Once the choice has been made, he/she must agree with every term and condition included in the chosen license.

Warning: Since the release of OpenOffice.org 1.1 the Italian dictionary is directly integrated into the applications ans so it doesn't need any manual installation. It is a good norm to verify that it has been activate. You can do so simply by selecting from the menu bar Tools->Options->Language Settings->Languages and by checking that the item "Italian (italy)" is selected and a slash with the letters ABC is displayed to its side.

If the dictionary is not activated yet, you can perform this action by selecting from the menu bar Tools->Options->Language Settings->Writing Aids and by clicking on the "Edit..." button you will find in the dialog window. In the new dialog that will appear, you can activate the dictionary.

In the case the dictionary doesn't still work or you wish to upgarde the version of your installed dictionary you can follow the procedures explained below.

How to install the dictionary:

1.	To install these dictionaries in OOo build 641c and greater:
  A.	Unzip the dictionary files, *.aff and *.dic, 
		into your <OpenOffice.org>\user\wordbook\*.*  directory

Attention: since OpenOffice.org 1.0.1 the right folder for the dictionary is <OpenOffice.org>\share\dict\ooo

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

4. Thanks (Last updated: July, 12 2003)

The users of a word processor, like of whatever application that utilizes a spell checker, often underestimate the work needed to produce this basic tool. There are a lot of problems: the Italian language is not static, but always evolving; simple misspelled words in a digital dictionary can cause several problems to the spell checker; what is commonly used in the spoken language, it is not always right in the written one.

Just to overcome such difficulties, the volunteers of the OpenOffice.org Community have actively took part into the quality check of this dictionary content. With this section, we want to give the right credit to all people who have collaborated in this activity.

The Most Outstanding Volunteers

Riccardo Caverni, Marco Saba aka Metropolinux

Motivation: both Riccardo and Marco contributed to the corretion of more than 4000 words by dedicating their time to the project without restricts. This is the reason why the Community bestow honors on them.

Special Mention

Edgardo Lugaresi, Marco Ciacci, Claudio Rampini, Elisa Calcagni, Carlo aka Cadfael, Giuseppe Delli Santi, Fabio Bossi aka bioFa, Giovanni Molteni

Motivation: they are always careful in their corrections and have checked the meaning of more than 1000 words by showing their will to collaborate to the improvement of the spell checker.

Other volunteers who have helped to check the Italian OpenOffice.org dictionary.

Ugo Bresolin, Carlo Facci, Silvio Bacchetta, Giuseppe Lettieri aka Peterpunk, Pierluigi Andreoli, Massimiliano Vessi, Giuseppe Santo Barile, Riccardo Furlan (Fsug-Venezia), Marco Menardi, Alex De Maria aka ADBlues, Claudia Ginocchio, Isaac (Fsug-Venezia), Andrea Spitaleri aka XspiriX, Mr. Crocodile, Joram, Daniele Vazzola aka Vazzo, Marco Spigolon, Mr Coke, Stefano Dal Pra, Giacomo Magnini, Giuseppe Garzotto aka double-g, Alberto (Fsug-Venezia), Mike, Andrea Dieni aka daigo, , Paolo Bolettieri, Paolo Finetti, Umberto Bertolini, Roberta Annoni, Gianmaria Visconti, Angelo Conforti aka angeloxx, Oliver Maurizio, Michele Bariani, Filippo Spanò Felipe, Mariangela Pansini, Galblait, Salvatore Comito aka Linuxino, Eugenio, Massimo, Rossella Diomede, Mauro Bonetti.

NOTE: The listing order of the volunteers is related to their contribution.
