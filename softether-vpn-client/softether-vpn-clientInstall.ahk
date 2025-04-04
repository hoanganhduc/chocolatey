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
ControlClick, Next, % winInstallTitle  ; Click the "Next" button
WinActivate
ControlClick, Next, % winInstallTitle  ; Click the "Next" button
WinActivate
ControlClick, Next, % winInstallTitle  ; Click the "Next" button

;MsgBox % "softether-vpn-client License"
WinWait, % winInstallTitle, % agreeEULText, 15
If ErrorLevel {
	MsgBox, License agreement window did not appear within timeout.
	ExitApp
}
WinActivate
; Check if the EULA checkbox is already checked
ControlGet, isChecked, Checked,, Button1, % winInstallTitle
if (!isChecked) {
	; If not checked, check it
	ControlClick, Button1, % winInstallTitle
}
; Click the Next button
ControlClick, Next, % winInstallTitle
Sleep, 100  ; Small delay to ensure the action is processed

;MsgBox % "softether-vpn-client Setup"
WinWait, % winInstallTitle
WinActivate
ControlClick, Next, % winInstallTitle
WinActivate
ControlClick, Next, % winInstallTitle
WinActivate
ControlClick, Next, % winInstallTitle
Send {Enter}

;MsgBox % "softether-vpn-client Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishedText
WinActivate
; Check if the "Start the SoftEther VPN Client Manager" checkbox is already checked
ControlGet, isChecked, Checked,, Button1, % winInstallTitle
if (isChecked) {
	; If checked, uncheck it
	ControlClick, Button1, % winInstallTitle
}
ControlClick, Finish, % winInstallTitle

;MsgBox % "softether-vpn-client Main Windows"
WinWait, % mainAppTitle,, 3
If ErrorLevel {
	ExitApp
}
Else {
	WinActivate
	Send {Alt down}{Q down}{Alt up}{Q up}
	Send {Enter}
	DetectHiddenWindows, On
	WinGet, AHKList, List, ahk_exe Autohotkey.exe
	Loop, %AHKList%
		IF (A_ScriptHwnd <> ID := AHKList%A_Index%)
			WinClose, ahk_id %ID%
	ExitApp
}

q::
DetectHiddenWindows, On
WinGet, AHKList, List, ahk_exe Autohotkey.exe
Loop, %AHKList%
	IF (A_ScriptHwnd <> ID := AHKList%A_Index%)
		WinClose, ahk_id %ID%
ExitApp
