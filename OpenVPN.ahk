if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

#NoEnv
if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

SendMode Input
SetWorkingDir %A_ScriptDir%
#Persistent
SetTitleMatchMode 2

; Set a hotkey to pause and un-pause the script
Hotkey, Pause, TogglePause

SetTimer, OpenVMWare, 300000
Return

OpenVMWare:
  WinRestore, vk1478129
  Sleep 1000
  Click, 2139, 949
  Sleep 1000
  WinMinimize, vk1478129
  Return

; This is the function that gets called when the hotkey is pressed
TogglePause:
  Pause, Toggle
  return