#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; Global hotkeys
#a::Run, "D:\Softwares\Portable Apps\Aquile Reader - Shortcut.lnk"
#b::Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
#+b::Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" -inprivate
#c::Run, "D:\Softwares\Portable Apps\GoogleChromePortable64\GoogleChromePortable.exe"
#+c::Run, "D:\Softwares\Portable Apps\GoogleChromePortable64\GoogleChromePortable.exe" -incognito
#d::Run, "C:\Users\robi\Downloads\"
#+d::Run, "D:\Documents\Reading Docs"
#+e::Run, "D:\Softwares\Portable Apps\Everything\Everything.exe"
#f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
#+f::Run, "C:\Program Files\Mozilla Firefox\firefox.exe" -private-window
#g::Run, "D:\Projects\autohotkey-urls\google.html"
#m::Run, "C:\Users\robi\AppData\Roaming\Telegram Desktop\Telegram.exe"
#+m::Run, "D:\Projects\autohotkey-urls\messenger.html"
#n::Run, "D:\Softwares\Portable Apps\Notepad++\notepad++.exe"
#p::Run, "D:\Softwares\Portable Apps\PicPick\PicPickPortable.exe"
#+p::Run, "D:\Projects"
#q::Run, "D:\Projects\autohotkey-urls\todoist.html"
#+r::Run, "D:\Projects\autohotkey-urls\books.html"
#+t::Run, "D:\Softwares\Portable Apps\TidyTabs\TidyTabsPortable.exe"
#+v::Run, "C:\Users\robi\AppData\Local\Programs\Microsoft VS Code\Code.exe"
#w::Run, "C:\Program Files\WindowsApps\5319275A.WhatsAppDesktop_2.2228.14.0_x64__cv1g1gvanyjgm\app\WhatsApp.exe"
#t::Run, "C:\Users\robi\AppData\Local\Microsoft\WindowsApps\wt.exe"
#z::Run, "C:\Users\robi\AppData\Roaming\CareUEyes\CareUEyes.exe"

;====================================================
;       Always on Top (Shift + Ctrl + Space) 	    ;
;====================================================

^+SPACE:: Winset, Alwaysontop, , A

;====================================================
;   Google Search select text - Ctrl + Shift + C    ;
;====================================================

^+c::
    {
        Send, ^c
        Sleep 50
        Run, http://www.google.com/search?q=%clipboard%
        Return
    }
return

;====================================================
;               Custom volume buttons	            ;
;====================================================

!Up:: Send {Volume_Up} ;alt + Up arrow
!Down:: Send {Volume_Down} ;alt + Down arrow
break::Send {Volume_Mute} ; Break key mutes

;====================================================
;               Default state of lock keys 	        ;
;====================================================

SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

;====================================================
;                  Suspend AutoHotkey               ;
;====================================================

; #+ScrollLock::Suspend ; Win + Shift + scrollLock
#ScrollLock::Suspend ; Win + scrollLock

return
