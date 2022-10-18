#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

;====================================================
;              Windows Terminal Shortcut		    ;
;====================================================

F12::ToggleTerminal()

ShowAndPositionTerminal()
{
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS

    SysGet, WorkArea, MonitorWorkArea
    TerminalWidth := A_ScreenWidth * 0.9
    TerminalHeight := A_ScreenHeight * 0.5

    WinMove, ahk_class CASCADIA_HOSTING_WINDOW_CLASS,, (A_ScreenWidth - TerminalWidth) / 2, WorkAreaTop - 2, TerminalWidth, TerminalHeight
}

ToggleTerminal()
{
    EnvGet, home, HOME
    EnvGet, localappdata, LOCALAPPDATA

    WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"

    DetectHiddenWindows, On

    if WinExist(WinMatcher)
        ; Window Exists
    {
        DetectHiddenWindows, Off

        ; Check if its hidden
        if !WinExist(WinMatcher) || !WinActive(WinMatcher)
        {
            ShowAndPositionTerminal()
        }
        else if WinExist(WinMatcher)
        {
            ; Script sees it without detecting hidden windows, so..
            WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
            Send !{Esc}
        }
    }
    else
    {
        Run "%localappdata%\Microsoft\WindowsApps\wt.exe", %home%
        Sleep, 1000
        ShowAndPositionTerminal()
    }
}
