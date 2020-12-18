#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1
SetControlDelay -1

; Title for setup windows
winInstallTitle := "pdfarranger Setup"
winInstallFinishText := "Completing the pdfarranger installer"

;MsgBox % "pdfarranger Setup"
WinWait, % winInstallTitle
BlockInput On
WinActivate
Send {Enter}
BlockInput Off

;MsgBox % "pdfarranger Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishText
ControlClick, Finish, % winInstallTitle, % winInstallFinishText,,, NA



