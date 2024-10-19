#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1
SetControlDelay -1

; Title for setup windows
winInstallTitle := "Setup - File Splitter and Joiner"
winRemoveTitle := "Setup"
winInstallFinishText := "Click Finish to exit Setup"

;MsgBox % "ffsj Remove Old"
WinWait, % winRemoveTitle
BlockInput On
WinActivate
Send {Enter}
BlockInput Off

;MsgBox % "ffsj Setup"
WinWait, % winInstallTitle
BlockInput On
WinActivate
Send {Enter}
Sleep 1000
Send {Enter}
BlockInput Off

;MsgBox % "ffsj Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishText
BlockInput On
WinActivate
Send {Space}
Send {Enter}
BlockInput Off

q::
DetectHiddenWindows, On
WinGet, AHKList, List, ahk_exe Autohotkey.exe
Loop, %AHKList%
	IF (A_ScriptHwnd <> ID := AHKList%A_Index%)
		WinClose, ahk_id %ID%
ExitApp