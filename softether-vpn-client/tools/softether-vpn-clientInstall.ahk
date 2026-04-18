#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force
#Warn
SetControlDelay 0
SetTitleMatchMode 2

logFile := A_Args.Length >= 1 ? A_Args[1] : A_Temp "\softether-vpn-client-install.log"
if FileExist(logFile)
	FileDelete logFile

LogStep(message) {
	global logFile
	FileAppend FormatTime(, "yyyy-MM-dd HH:mm:ss") " | " message "`n", logFile, "UTF-8"
}

ExitWithCode(code, message) {
	LogStep(message)
	ExitApp code
}

ClickButtonByText(winTitle, winText, buttonText) {
	for ctrl in WinGetControls(winTitle, winText) {
		try ctrlText := ControlGetText(ctrl, winTitle, winText)
		catch
			continue

		if InStr(StrLower(StrReplace(ctrlText, "&")), StrLower(buttonText)) {
			ControlClick ctrl, winTitle, winText
			return true
		}
	}

	return false
}

FindControlByText(winTitle, winText, text) {
	for ctrl in WinGetControls(winTitle, winText) {
		try ctrlText := ControlGetText(ctrl, winTitle, winText)
		catch
			continue

		if InStr(StrLower(StrReplace(ctrlText, "&")), StrLower(text))
			return ctrl
	}

	return ""
}

FocusDialogControl(ctrl, winTitle, winText) {
	try ctrlHwnd := ControlGetHwnd(ctrl, winTitle, winText)
	catch
		return false

	PostMessage 0x0028, ctrlHwnd, 1,, winTitle, winText
	return true
}

; Title for setup windows
winInstallTitle := "SoftEther VPN Setup Wizard"
agreeEULText := "I agree to the End User License Agreement"
mainAppTitle := "SoftEther VPN Client Manager"
winInstallFinishedText := "The setup process of SoftEther VPN Client has completed successfully"

; Initial setup screen
LogStep("Waiting for initial setup screen")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on initial setup screen")
}
Else
	ExitWithCode(1, "Timed out waiting for initial setup screen")

; Next screen
LogStep("Waiting for second setup screen")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on second setup screen")
}
Else
	ExitWithCode(1, "Timed out waiting for second setup screen")

; Third screen
LogStep("Waiting for third setup screen")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on third setup screen")
}
Else
	ExitWithCode(1, "Timed out waiting for third setup screen")

; License agreement screen
LogStep("Waiting for EULA screen")
If WinWait(winInstallTitle, agreeEULText, 20)
{
	; Check if the EULA checkbox is already checked
	isChecked := ControlGetChecked("Button1", winInstallTitle)
	if (!isChecked)
		ControlClick "Button1", winInstallTitle  ; Check it if not checked
	
	ControlClick "Next", winInstallTitle
	LogStep("Accepted EULA and moved to next screen")
}
Else
	ExitWithCode(1, "Timed out waiting for EULA screen")

; Continue with installation screens
LogStep("Waiting for post-EULA setup screen 1")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on post-EULA setup screen 1")
}
Else
	ExitWithCode(1, "Timed out waiting for post-EULA setup screen 1")

LogStep("Waiting for post-EULA setup screen 2")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on post-EULA setup screen 2")
}
Else
	ExitWithCode(1, "Timed out waiting for post-EULA setup screen 2")

LogStep("Waiting for install confirmation screen")
If WinWait(winInstallTitle,, 20)
{
	ControlClick "Next", winInstallTitle
	LogStep("Clicked Next on install confirmation screen")
}
Else
	ExitWithCode(1, "Timed out waiting for install confirmation screen")

Send "{Enter}"
LogStep("Started installation and waiting for completion page")

; Final screen
If WinWait(winInstallTitle, winInstallFinishedText, 600)
{
	LogStep("Reached final completion screen")

	checkboxCtrl := FindControlByText(winInstallTitle, winInstallFinishedText, "Start the SoftEther VPN Client Manager")
	if (checkboxCtrl != "") {
		try isChecked := ControlGetChecked(checkboxCtrl, winInstallTitle, winInstallFinishedText)
		catch
			isChecked := 0

		if (isChecked) {
			ControlClick checkboxCtrl, winInstallTitle, winInstallFinishedText
			LogStep("Unchecked SoftEther VPN Client Manager launch checkbox")
		}
	}

	Sleep 300

	clickedFinish := false
	finishCtrl := FindControlByText(winInstallTitle, winInstallFinishedText, "Finish")
	if (finishCtrl != "") {
		WinActivate winInstallTitle
		WinWaitActive winInstallTitle,, 2

		if FocusDialogControl(finishCtrl, winInstallTitle, winInstallFinishedText)
			LogStep("Moved dialog focus to Finish button")

		try {
			ControlSend "{Space}", finishCtrl, winInstallTitle, winInstallFinishedText
			clickedFinish := WinWaitClose(winInstallTitle,, 2)
		}
		catch
			clickedFinish := false

		if (!clickedFinish) {
			try {
				ControlClick finishCtrl, winInstallTitle, winInstallFinishedText
				clickedFinish := WinWaitClose(winInstallTitle,, 2)
			}
			catch
				clickedFinish := false
		}

		if (!clickedFinish) {
			try {
				ControlGetPos &finishX, &finishY, &finishW, &finishH, finishCtrl, winInstallTitle, winInstallFinishedText
				CoordMode "Mouse", "Window"
				Click finishX + (finishW // 2), finishY + (finishH // 2)
				clickedFinish := WinWaitClose(winInstallTitle,, 2)
			}
			catch
				clickedFinish := false
		}
	}

	if (!clickedFinish) {
		WinActivate winInstallTitle
		Sleep 200
		Send "{Tab}"
		Sleep 100
		Send "{Enter}"
		clickedFinish := WinWaitClose(winInstallTitle,, 2)
	}

	if !WinWaitClose(winInstallTitle,, 3) {
		clickedFinish := ClickButtonByText(winInstallTitle, winInstallFinishedText, "Finish")
		if (clickedFinish)
			clickedFinish := WinWaitClose(winInstallTitle,, 2)

		if (!clickedFinish) {
			WinActivate winInstallTitle
			Sleep 200
			Send "!f"
			clickedFinish := WinWaitClose(winInstallTitle,, 2)
		}
	}

	if !clickedFinish
		ExitWithCode(1, "Timed out closing installer from final completion screen")
}
Else
	ExitWithCode(1, "Timed out waiting for final completion screen after starting installation")

; Handle any client manager window that might appear
If WinWait(mainAppTitle,, 3)
{
	LogStep("Closing SoftEther VPN Client Manager")
	WinActivate
	Send "!q"  ; Alt+Q
	Send "{Enter}"
}

ExitWithCode(0, "Installer automation completed")
