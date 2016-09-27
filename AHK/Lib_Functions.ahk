DetectHiddenWindows, On
SetTitleMatchMode Regex ;可以使用正则表达式对标题进行匹配

; Functions
SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
    Sleep, 200
    Return
}  ;http://www.zhihu.com/question/41446565/answer/91110371

;EnvGet, user, UserName
; user Administrator: 22inch, 1920*1080, pcscale=1, browserscale=1.25
; user Mu: 15inch, 1920*1080, pcscale=1, browserscale=1.25, two screen  
ColorWait(cycle){
; work with Pace4Chrome, modify its color to DD0000
  Lstart :=false
  Loop, %cycle% {  
       PixelGetColor,VarColor, 1865,208,RGB    
       If (VarColor = "0xDD0000" ) {
           Lstart :=true 
       }
       If ( Lstart && VarColor <> "0xDD0000" ) {
            Lfound :=true
            Break
       } Else  { 
            Lfound :=false
            Sleep, 10
       }          
  }
  SwitchIME(0x08040804)
  Sleep, 500 
  Return %Lfound%
}

PassSSL(){
; pass the ssl check for IE
     Sleep, 3000
     SwitchIME(0x08040804)
     Send, {Click 600,300}
     SendInput, {Tab 2}{Enter}  
}

LastDir(){
     WinGetText,latdirtext, ahk_class CabinetWClass
     StringReplace, latdirtext, latdirtext, `r`n,%A_SPACE%, All
     Lastdir := RegExReplace(latdirtext,".*地址: (.*) 地址区段.*", "$1")
     Return %Lastdir%
}

DownListGet(maxn,keyword){
    Loop, %maxn% {
         SendInput, {Down} 
         Clipboard=
         SendInput, ^c
         ClipWait, 2
         If (InStr(Clipboard,keyword) >0) {
            SendInput, {Enter}
            Break
        }
    }
    Return
}

EncryPass(inpass,charshift){
  outpass :=""
  Loop, Parse, inpass 
  {
        outchar :=Chr(Asc(A_LoopField)+charshift)
        outpass :=outpass outchar
  }
  Return %outpass%
}

