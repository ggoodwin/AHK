Set WshShell = CreateObject("WScript.Shell" ) 
  WshShell.Run """E:\AHK\OpenShell.ahk""", 0
  WshShell.Run """E:\AHK\CommonShortcuts.ahk""", 0
  WshShell.Run """E:\AHK\EncryptedTextFile.ahk""", 0
  Set WshShell = Nothing