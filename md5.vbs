' GENERATORE COPIA CONFORME
' DALLA SELEZIONE DEI FILE CON INVIA A 
' VIENE GENERATO UN FILE DI TESTO CON GLI HASH ED I NOMI DEI FILES

' Autore : RUGGERO RUGGERI 23/06/2015


' # PARAMETRI MODIFICABILI #'

' Posizione per il software per il calcolo hash (fciv)'
strMd5Command = "c:\copiaconforme\fciv.exe"


strIntestazioneLettera = "COMUNE DI RIMINI " & Now() &  vbCrLf & vbCrLf & _
                         "DICHIARAZIONE DI CONFORMITA' ALL'ORIGINALE DELLA COPIA DI ATTI O DOCUMENTI" & vbCrLf & vbCrLf & _
                         "Il sottoscritto dichiara che i seguenti documenti digitali identificati da nome del file ed impronta digitale (hash) sono conformi agli originali."  & vbCrLf & vbCrLf 

strPiedeLettera = vbCrLf & vbCrLf & _
                  "Nota: l'impronta digitale è calcolata attraverso algoritmo  md5 (RFC 1321) e SHA-1 " & vbCrLf & vbCrLf & _
                  "Il documento è firmato digitalmente"

' # Esecuzione ** NON MODIFICARE ** '


strIntestazioneMD5_SHA1 = "                MD5                             SHA-1                    " & vbCrLf & _
                          "-------------------------------------------------------------------------"


Function timeStamp()
    Dim t 
    t = Now
    timeStamp = Year(t) & "-" & _
    Right("0" & Month(t),2)  & "-" & _
    Right("0" & Day(t),2)  & "_" & _  
    Right("0" & Hour(t),2) & _
    Right("0" & Minute(t),2) '    '& _    Right("0" & Second(t),2) 
End Function


Set objArgs = Wscript.Arguments
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = wscript.createobject("wscript.shell")


strMessage = ""
strFolder = ""
strCopiaFullPathName = ""

For Each strArg in objArgs
  WScript.Echo "Processing ... "
  WScript.Echo strArg
  Set objFile = objFSO.GetFile(strArg)
  Wscript.Echo "File name: " & objFSO.GetFileName(objFile)
  Wscript.Echo "Absolute path: " & objFSO.GetAbsolutePathName(objFile)
  Wscript.Echo "Parent folder: " & objFSO.GetParentFolderName(objFile) 
  Wscript.Echo "File name: " & objFSO.GetFileName(objFile)
  Wscript.Echo "Base name: " & objFSO.GetBaseName(objFile)
  Wscript.Echo "Extension name: " & objFSO.GetExtensionName(objFile)  
  
  strFolder = objFSO.GetParentFolderName(objFile)
  strFileName = objFSO.GetFileName(objFile)

  'Preparazione del comando da eseguire:

  strExecuteCommand = strMd5Command & " " & strArg & " -both"

  WScript.Echo strExecuteCommand  
  Set oExec = objShell.Exec(strExecuteCommand)

	Do While Not oExec.StdOut.AtEndOfStream
	    strText = oExec.StdOut.ReadLine()
	    'Wscript.Echo strText
	Loop

    'Split output per i files

    Wscript.Echo strText


    arrToken=split(strText, " ")

    Wscript.Echo arrToken(0)

  'strRow = ""
	'for each x in arrToken
  ''  	Wscript.Echo "Par:" & x
  ''    strRow = strRow & x & " "
	'next

	strMessage = strMessage & arrToken(0)  & " " & arrToken(1)  & " " & strFileName  & vbCrLf

Next


strMessage = strIntestazioneMD5_SHA1 & vbCrLf & strMessage

' Write Copia Conforme
strDateNow = timeStamp()
strCopiaFullPathName=strFolder & "\DichiarazioneCopiaConforme-" & strDateNow & ".txt"
strFullMessage = strIntestazioneLettera & vbCrLf & strMessage & vbCrLf & strPiedeLettera

Wscript.Echo strCopiaFullPathName
Wscript.Echo strDateNow
Wscript.Echo strFullMessage


' Scrive il file della Copia conforme '
Set objFSO = objFSO.CreateTextFile(strCopiaFullPathName,True)
objFSO.Write strFullMessage
objFSO.Close


'Clear the objects at the end of your script.
set objArgs = Nothing
set objShell = Nothing
set objShell = Nothing
set objFSO = Nothing

MsgBox "Documento di copia conforme:" & vbCrLf & strCopiaFullPathName & vbCrLf & "creato correttamente!"