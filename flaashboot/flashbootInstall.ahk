#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1
SetControlDelay -1

; Title for setup windows
winInstallTitle := "Setup - FlashBoot"
winInstallFinishText := "Completing the FlashBoot Setup Wizard"

;MsgBox % "Setup - FlashBoot"
WinWait, % winInstallTitle
BlockInput On
WinActivate
Send {Enter}
Send {Enter}
Send {Enter}
Send {Enter}
Send {Enter}
BlockInput Off

;MsgBox % "pdfarranger Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishText
BlockInput On
WinActivate
Send {Space}
Send {Enter}
BlockInput Off