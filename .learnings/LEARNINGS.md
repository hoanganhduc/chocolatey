# Learnings

## [LRN-20260418-001] Launch AutoHotkey by real exe, not Chocolatey shim

**Logged**: 2026-04-18T14:32:00Z
**Priority**: high
**Status**: pending

- What happened: `Start-Process AutoHotKey` returned the Chocolatey shim process in `C:\ProgramData\chocolatey\bin\AutoHotkey.exe`, which exited immediately while the real script host kept running from `autohotkey.portable\tools\AutoHotkey.exe`.
- Reusable lesson: when install automation needs to wait for or inspect an AutoHotkey process started from Chocolatey, target the real executable path under `autohotkey.portable\tools\` instead of the shim.
- Promotion target (if any): future Chocolatey package automation notes for GUI installers that use AutoHotkey.
