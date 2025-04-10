#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force
#Warn
SetControlDelay -1
SetTitleMatchMode 2

; Title for setup windows
winInstallTitle := "SoftEther VPN Setup Wizard"
agreeEULText := "I agree to the End User License Agreement"
mainAppTitle := "SoftEther VPN Client Manager"
winInstallFinishedText := "The setup process of SoftEther VPN Client has completed successfully"

; Initial setup screen
If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

; Next screen
If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

; Third screen
If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

; License agreement screen
If WinWait(winInstallTitle, agreeEULText, 20)
{
	; Check if the EULA checkbox is already checked
	isChecked := ControlGetChecked("Button1", winInstallTitle)
	if (!isChecked)
		ControlClick "Button1", winInstallTitle  ; Check it if not checked
	
	ControlClick "Next", winInstallTitle
}
Else
	ExitApp 1

; Continue with installation screens
If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

If WinWait(winInstallTitle,, 20)
	ControlClick "Next", winInstallTitle
Else
	ExitApp 1

Send "{Enter}"

; Final screen
If WinWait(winInstallTitle, winInstallFinishedText, 20)
{
	; Uncheck "Start the SoftEther VPN Client Manager" if it's checked
	isChecked := ControlGetChecked("Button1", winInstallTitle)
	if (isChecked)
		ControlClick "Button1", winInstallTitle  ; Uncheck it
}

If WinWait(winInstallTitle, winInstallFinishedText, 20) {
	WinActivate winInstallTitle
	Send "{Enter}"
}

; Handle any client manager window that might appear
If WinWait(mainAppTitle,, 3)
{
	WinActivate
	Send "!q"  ; Alt+Q
	Send "{Enter}"
}

ExitApp 0
