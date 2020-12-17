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
winWizardText := "Select whether you want to repair or remove pdfarranger"

repairpdfarranger = 0

time := A_Now
time+= 60

findFirstWindow:
Loop
{
    ; search for the wizard window
    ; if this is found, the setup will repair/remove the software
    ; we will use the default repair option
    IfWinExist, % winInstallTitle, % winWizardText
    {
        repairpdfarranger = 1
        break findFirstWindow
    }
    Sleep, 100
    if (A_Now = time)
        break findFirstWindow
}

;MsgBox % "pdfarranger Setup"
if (repairpdfarranger) {
    WinWait, % winInstallTitle, % winWizardText
    ControlClick, Finish, % winInstallTitle, % winWizardText
}
else {
    WinWait, % winInstallTitle
    ControlClick, Next, % winInstallTitle
}

;MsgBox % "pdfarranger Setup Finish"
WinWait, % winInstallTitle, % winInstallFinishText
ControlClick, Finish, % winInstallTitle



