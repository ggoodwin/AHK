if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

#NoEnv

SendMode Input
; SetWorkingDir, %A_ScriptDir%

#SingleInstance, Force

^!n:: Selected_File()

Selected_File()
{
    ; Handles Explorer
    IfWinActive, ahk_class CabinetWClass
    {
        for window in ComObjCreate("Shell.Application").Windows
            if window.HWND = WinExist("A")
            this_window := window

        ; If multiple Items selected
        if(this_window.Document.SelectedItems.Count > 1)
        {
            return false
        }
        else
            Run, "C:\Program Files\Notepad++\notepad++.exe" %this_window.Document.FocusedItem.Path%
    }

    ; Handles Desktop
    if(WinActive("ahk_class Progman") || WinActive("ahk_class WorkerW"))
    {
        ControlGet, selectedFiles, List, Selected Col1, SysListView321, A

        ; If multiple Items selected
        if InStr(selectedFiles, "`n")
        {
            these_files := ""
            Loop, Parse, selectedFiles, `n, `r
                these_files .= A_Desktop . "\" . A_LoopField . "`n"

            return these_files
        }
        else
            return A_Desktop . "\" . selectedFiles
    }
    else
        return false
}