#Warn ; Enable warnings to assist with detecting common errors.
SetKeyDelay(100) ; Increased delay between keystrokes
SetMouseDelay(100) ; Increased delay for mouse movements
SetWorkingDir(A_ScriptDir) ; Ensures a consistent starting directory.
SetTitleMatchMode(2) ; Less strict matching
SetControlDelay(100)

; Title for setup windows
winInstallTitle := "PDF Arranger Setup"
winInstallFinishText := "Completing the pdfarranger installer"
winInstallCancelText := "Are you sure you want to cancel pdfarranger installation"
winRepairRemoveText := "Select whether you want to repair or remove PDF Arranger" ; Text that appears when already installed

; Wait for the first installer window
WinWait(winInstallTitle)
Sleep(1000)

; Handle all screens until we reach the finish screen
Loop {
    if WinExist(winInstallTitle, winInstallFinishText)
        break
    
    ; Handle repair/remove screen if it appears
    if WinExist(winInstallTitle, winRepairRemoveText) {
        WinActivate(winInstallTitle)
        Send("{Enter}") ; Press Enter to proceed with default option
        Sleep(2000) ; Wait longer for processing
    }
    
    if WinExist(winInstallTitle) {
        WinActivate(winInstallTitle)
        Send("{Enter}") ; Press Enter to proceed with default option
        Sleep(4000) ; Wait longer for next screen to load and processing
    }
    
    ; Handle cancel dialog if it appears
    if WinExist(winInstallTitle, winInstallCancelText) {
        WinActivate(winInstallTitle)
        Send("{Enter}") ; Press Enter for default option (usually "No" to cancel)
        Sleep(1000)
    }
}

; Finish the installation
WinWait(winInstallTitle, winInstallFinishText)
WinActivate(winInstallTitle)
; Click the Finish button instead of pressing Enter
ControlClick("Button1", winInstallTitle) ; Typically, the Finish button is the first button
Sleep(2000) ; Give time for the installer to complete

ExitApp() ;
