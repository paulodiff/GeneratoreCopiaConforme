#Generatore di Copia Conforme Automatica

##Introduzione

A seguito dell'incontro con l'avvocato Belisario del 18 giugno 2015, si è appreso che i documenti digitali che sono copia di un originale cartaceo devono essere dichiarati "copie conformi" attraverso una dichiarazione firmata digitalmente.

La dichiarazione di copia conforme può essere un semplice file di testo dove sono riportati i nomi dei  file digitali ed il codice HASH calcolato.

Ad esempio:

```sh
DICHIARAZIONE DI CONFORMITA' ALL'ORIGINALE DELLA COPIA DI ATTI O DOCUMENTI 

Il sottoscritto dichiara che i seguenti documenti digitali identificati da nome del file ed impronta digitale (hash) sono conformi agli originali.

	
                MD5                             SHA-1                    
-------------------------------------------------------------------------
b133555217f2edf4da555ae8b60fef27 21ec6e365318c9fae5943b06de49d7635a7cd2e2 a.pdf
9540bedc071c150c3ad2fdcc70aee294 b284246ef8cab09be786c3f84369f076972efa22 b.pdf

Nota: l'impronta digitale è calcolata attraverso algoritmo standard md5 (RFC 1321) e SHA-1 



Il presente documento è firmato digitalmente

Rimini 01/01/2000
```


##Descrizione del software

Il programma è stato realizzato in VBScript; viene usato un generatore di hash standard (nelle note i riferimenti) md5 esterno per aumentare la velocità di esecuzione.
Il software si avvale della funzione di windows "INVIA A" che permette di selezione più file di una cartella ed inviarli al generatore di Copia Conforme che prendendoli come input calcola gli hash e crea il file di testo 
Le instestazione ed il piede del documento di testo sono personalizzabili modificando il file md5.vbs

##Installazione

> La piattaforma utilizzata Windows 7 x86
> Il software per il calcolo degli hash MD5 ed SHA-1 di Microsoft (Microsoft File Checksum Integrity Verifier)

Copiare in una cartella qualsiasi ad es: c:\copiaconforme i seguenti files:

```sh
md5.vbs
fciv.exe
```

Aprire esplora risorse e nella barra degli indirizzi indicare 

```sh
shell:sendto
```

All'interno della cartella creare un nuovo collegamento, e come percorso di collemento digitare
```sh
C:\Windows\System32\cscript.exe c:\copiaconforme\md5.vbs
```
Poi come nome del collegamento inserire:
```sh
GENERATORE DI COPIA CONFORME
```
##Utilizzo

Per utilizzare il software è sufficiente selezionare i file per i quali è necessario generare la copia conforme con il tasto destro del mouse selezionare INVIA A e poi GENERATORE COPIA CONFORME, nella stessa cartella verrà generato un file di testo di questo tipo:

DichiarazioneCopiaConforme-AAAA-MM-DD_hhmm.txt

##Note

Software per il calcolo dell'impronta hash md5 (RFC 1321) e SHA-1

* https://www.microsoft.com/en-us/download/details.aspx?id=11533 (Microsoft File Checksum Integrity Verifier)
* http://esrg.sourceforge.net/utils_win_up/md5sum/
* https://www.fourmilab.ch/md5/ (scelto)
* https://it.wikipedia.org/wiki/MD5


##Per qualsiasi informazione 

ruggero.ruggeri@comune.rimini.it
