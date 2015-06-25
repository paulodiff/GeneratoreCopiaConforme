#Generatore di Copia Conforme Automatica

##Introduzione

A seguito dell'incontro con l'avvocato Belisario del 18 giugno 2015, si è appreso che i documenti digitali che sono copia di un originale cartaceo devono essere dichiarati "copie conformi" attraverso una dichiarazione firmata digitalmente.

La dichiarazione di copia conforme può essere un semplice file di testo dove sono riportati i nomi dei  file digitali ed il codice HASH calcolato.

Ad esempio:

```sh
DICHIARAZIONE DI CONFORMITA' ALL'ORIGINALE DELLA COPIA DI ATTI O DOCUMENTI 

Il sottoscritto dichiara che i seguenti documenti digitali identificati da nome del file ed impronta digitale (hash) sono conformi agli originali.

B133555217F2EDF4DA555AE8B60FEF27 thesis.pdf
59BD4E3EB9F9345EC43A93BD54561979 dematerializzazionebelisario_maggioli.pdf
90C0C06791C4BD985656D5B549D37483 ConvegnoIdem4-mazzini-pres.pdf

Nota: l'impronta digitale è calcolata attraverso algoritmo standard md5 (RFC 1321)

Il presente documento è firmato digitalmente

Rimini 01/01/2000
```


##Descrizione del software

Il programma è stato realizzato in VBScript; viene usato un generatore di hash standard (nelle note i riferimenti) md5 esterno per aumentare la velocità di esecuzione.
Il software si avvale della funzione di windows "INVIA A" che permette di selezione più file di una cartella ed inviarli al generatore di Copia Conforme che prendendoli come input calcola gli hash e crea il file di testo 
Le instestazione ed il piede del documento di testo sono personalizzabili modificando il file md5.vbs

##Installazione

Copiare in una cartella qualsiasi ad es: c:\copiaconforme i seguenti files:

```sh
md5.vbs
md5.exe
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

Software per il calcolo dell'impronta hash md5 (RFC 1321)

* http://esrg.sourceforge.net/utils_win_up/md5sum/
* https://www.fourmilab.ch/md5/ (scelto)

##Per qualsiasi informazione 

ruggero.ruggeri@comune.rimini.it
