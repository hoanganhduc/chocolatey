#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetControlDelay -1

; Title for setup windows
winInstallTitle := "SoftEther VPN Setup Wizard"
agreeEULText := "I agree to the End User License Agreement"
openAppText := "Start the SoftEther VPN Client Manager."
mainAppTitle := "SoftEther VPN Client Manager"
winInstallFinishedText := "The setup process of SoftEther VPN Client has completed successfully"

;MsgBox % "softether-vpn-client Setup"
WinWait, % winInstallTitle
WinActivate
Send {Enter}
WinActivate
Send {Enter}
WinActivate
Send {Enter}

;MsgBox % "softether-vpn-client License"
WinWait, % winInstallTitle, % agreeEULText
WinActivate
Gui, Add, Checkbox, vAgreeEUL, % agreeEULText
Gui, Submit, NoHide ;
If (AgreeEUL = 0) {
	WinActivate
	Send {Enter}
    Send {Tab}
    Send {Tab}
    Send {Space}
    Send {Enter}
}

;MsgBox % "softether-vpn-client Setup"
WinWait, % winInstallTitle
WinActivate
Send {Enter}
WinActivate
Send {Enter}
WinActivate
Send {Enter}

;MsgBox % "softether-vpn-client Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishedText
WinActivate
Gui, Add, Checkbox, vAgreeOpenApp, % openAppText
Gui, Submit, NoHide ;
WinActivate
Send {Tab}
Send {Space}
Send {Enter}

;MsgBox % "softether-vpn-client Main Windows"
WinWait, % mainAppTitle,, 3
If ErrorLevel {
	ExitApp
}
Else {
	WinActivate
	Send {Alt down}{Q down}{Alt up}{Q up}
	Send {Enter}
}

DetectHiddenWindows, On
SetTitleMatchMode, 2
Loop {
   WinClose, .ahk
   IfWinNotExist, .ahk
      Break     ;No [more] matching windows found
}

ExitApp
