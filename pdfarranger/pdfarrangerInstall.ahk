#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1
SetControlDelay -1

; Title for setup windows
winInstallTitle := "pdfarranger Setup"
winInstallFinishText := "Completing the pdfarranger installer"
winInstallCancelText := "Are you sure you want to cancel pdfarranger installation"

;MsgBox % "pdfarranger Setup"
WinWait, % winInstallTitle
WinActivate
Send {Enter}

IfWinExist, % winInstallTitle, % winInstallCancelText,, 
{
    ;MsgBox % "pdfarranger Setup Cancel"
    WinWait, % winInstallTitle, % winInstallCancelText
    WinActivate
    Send {Enter}
}

;MsgBox % "pdfarranger Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishText
WinActivate
Send {Enter}



