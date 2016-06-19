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
ColorWait(carx1,cary1,RGBColor1,carx2,cary2,RGBColor2,carx3,cary3,RGBColor3){
  Loop, 30 {  
       PixelGetColor,VarColor1, carx1,cary1,RGB 
       PixelGetColor,VarColor2, carx2,cary2,RGB 
       PixelGetColor,VarColor3, carx3,cary3,RGB       
       If (VarColor1 = "0x"RGBColor1 || VarColor2 = "0x"RGBColor2 || VarColor3 = "0x"RGBColor3) { 
            Lfound :=true
            Break
       } Else  { 
            Lfound :=false
            Sleep, 100
       }          
  }
  SwitchIME(0x08040804)
  Sleep, 500 
  Return %Lfound%
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