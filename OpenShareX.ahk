if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#NoEnv

SendMode Input
SetWorkingDir, %A_ScriptDir%

#SingleInstance, Force

; Open an executable as an administrator
RunAs, Administrator, "C:\Program Files\ShareX\ShareX.exe"