#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; SpaceTab
!Space::!Tab
return

; Default state of lock keys
SetNumlockState, AlwaysOn
SetScrollLockState, AlwaysOff
return

; Testing onscreen capslock visual
SetCapsLockState, Off
width := A_ScreenWidth - 202
height := A_ScreenHeight - 70

~*CapsLock::
 
Sleep, 100
if GetKeyState("CapsLock", "T") {
	Progress, B1 W200 H28 ZH0 FS11 WS900 x%width% y%height% CTFF0000, caps
} else {
	Progress, off
} 
return