' GENERATORE COPIA CONFORME
' DALLA SELEZIONE DEI FILE CON INVIA A 
' VIENE GENERATO UN FILE DI TESTO CON GLI HASH ED I NOMI DEI FILES

' Autore : RUGGERO RUGGERI 23/06/2015


' # PARAMETRI MODIFICABILI #'

' Posizione MD5 per il calcolo hash'
strMd5Command = "c:\copiaconforme\md5.exe"


strIntestazioneLettera = "COMUNE DI RIMINI " & Now() &  vbCrLf & vbCrLf & _
                         "DICHIARAZIONE DI CONFORMITA' ALL'ORIGINALE DELLA COPIA DI ATTI O DOCUMENTI" & vbCrLf & vbCrLf & _
                         "Il sottoscritto dichiara che i seguenti documenti digitali identificati da nome del file ed impronta digitale (hash) sono conformi agli originali."  & vbCrLf & vbCrLf 

strPiedeLettera = vbCrLf & vbCrLf & _
                  "Nota: l'impronta digitale è calcolata attraverso algoritmo standard md5 (RFC 1321)" & vbCrLf & vbCrLf & _
                  "Il documento è firmato digitalmente"

' # Esecuzione ** NON MODIFICARE ** '

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

  strExecuteCommand = strMd5Command & " " & strArg

  WScript.Echo strExecuteCommand  
  Set oExec = objShell.Exec(strExecuteCommand)

	Do While Not oExec.StdOut.AtEndOfStream
	    strText = oExec.StdOut.ReadLine()
	    Wscript.Echo strText
	Loop

    arrToken=split(strText, "  ")

    Wscript.Echo arrToken(0)

	'for each x in arrToken
    ' 	Wscript.Echo "Par:" & x
    '	strMessage = strMessage & x & " "
	'next

	strMessage = strMessage & arrToken(0)  & " " & strFileName  & vbCrLf

Next


' Write Copia Conforme
strDateNow = timeStamp()
strCopiaFullPathName=strFolder & "\DichiarazioneCopiaConforme-" & strDateNow & ".txt"
strFullMessage = strIntestazioneLettera & vbCrLf & strMessage & vbCrLf & strPiedeLettera

Wscript.Echo strCopiaFullPathName
Wscript.Echo strDateNow
Wscript.Echo strFullMessage


Set objFSO = objFSO.CreateTextFile(strCopiaFullPathName,True)
objFSO.Write strFullMessage
objFSO.Close

'msgbox "First parameter passed was "  & var1 & " and second parameter passed was " & var2

'Clear the objects at the end of your script.
set objArgs = Nothing
set objShell = Nothing
set objShell = Nothing
set objFSO = Nothing

MsgBox "Documento di copia conforme:" & vbCrLf & strCopiaFullPathName & vbCrLf & "creato correttamente!"