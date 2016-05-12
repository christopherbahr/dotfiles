; Caps lock -> ctrl/esc. This one doesn't seem to suffer from sending escape after a control sequence.
; https://gist.github.com/sedm0784/4443120

g_LastCtrlKeyDownTime := 0
g_AbortSendEsc := false
g_ControlRepeatDetected := false

*CapsLock::
    if (g_ControlRepeatDetected)
    {
        return
    }

    send,{Ctrl down}
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true

    return

*CapsLock Up::
    send,{Ctrl up}
    g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    if (time_elapsed <= 250)
    {
        SendInput {Esc}
    }
    return

~*^a::
    g_AbortSendEsc := true
    return
~*^b::
    g_AbortSendEsc := true
    return
~*^c::
    g_AbortSendEsc := true
    return
~*^d::
    g_AbortSendEsc := true
    return
~*^e::
    g_AbortSendEsc := true
    return
~*^f::
    g_AbortSendEsc := true
    return
~*^g::
    g_AbortSendEsc := true
    return
~*^h::
    g_AbortSendEsc := true
    return
~*^i::
    g_AbortSendEsc := true
    return
~*^j::
    g_AbortSendEsc := true
    return
~*^k::
    g_AbortSendEsc := true
    return
~*^l::
    g_AbortSendEsc := true
    return
~*^m::
    g_AbortSendEsc := true
    return
~*^n::
    g_AbortSendEsc := true
    return
~*^o::
    g_AbortSendEsc := true
    return
~*^p::
    g_AbortSendEsc := true
    return
~*^q::
    g_AbortSendEsc := true
    return
~*^r::
    g_AbortSendEsc := true
    return
~*^s::
    g_AbortSendEsc := true
    return
~*^t::
    g_AbortSendEsc := true
    return
~*^u::
    g_AbortSendEsc := true
    return
~*^v::
    g_AbortSendEsc := true
    return
~*^w::
    g_AbortSendEsc := true
    return
~*^x::
    g_AbortSendEsc := true
    return
~*^y::
    g_AbortSendEsc := true
    return
~*^z::
    g_AbortSendEsc := true
    return


;; Shift sequence.
;; (inspired by https://gist.github.com/sedm0784/4443120)
;; Good god is it ugly though... Seems like there must be a better way.

;g_LastLShiftKeyDownTime := 0
;g_AbortSendLParen := false
;g_LShiftRepeatDetected := false

;*LShift::
    ;if (g_LShiftRepeatDetected)
    ;{
        ;return
    ;}

    ;send,{LShift down}
    ;g_LastLShiftKeyDownTime := A_TickCount
    ;g_AbortSendLParen := false
    ;g_LShiftRepeatDetected := true

    ;return

;*LShift Up::
    ;send,{LShift up}
    ;g_LShiftRepeatDetected := false
    ;if (g_AbortSendLParen)
    ;{
        ;return
    ;}
    ;current_time := A_TickCount
    ;time_elapsed := current_time - g_LastLShiftKeyDownTime
    ;if (time_elapsed <= 250)
    ;{
        ;SendInput {(}
    ;}
    ;return

;; Experimentally switch from ) to { since vim very nicely closes these most of
;; the time
;; RShift -> RShift/{. This one doesn't seem to suffer from sending { after a
;; Shift sequence.
;; (inspired by https://gist.github.com/sedm0784/4443120)

;g_RastRShiftKeyDownTime := 0
;g_AbortSendRParen := false
;g_RShiftRepeatDetected := false

;*RShift::
    ;if (g_RShiftRepeatDetected)
    ;{
        ;return
    ;}

    ;send,{RShift down}
    ;g_RastRShiftKeyDownTime := A_TickCount
    ;g_AbortSendRParen := false
    ;g_RShiftRepeatDetected := true

    ;return

;*RShift Up::
    ;send,{RShift up}
    ;g_RShiftRepeatDetected := false
    ;if (g_AbortSendRParen)
    ;{
        ;return
    ;}
    ;current_time := A_TickCount
    ;time_elapsed := current_time - g_RastRShiftKeyDownTime
    ;if (time_elapsed <= 250)
    ;{
        ;SendInput {{}
    ;}
    ;return

;;When to abort sending the paren
;~*+a::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+b::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+c::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+d::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+e::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+f::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+g::
;g_AbortSendRParen := true
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+h::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+i::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+j::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+k::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+l::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+m::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+n::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+o::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+p::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+q::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+r::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+s::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+t::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+u::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+v::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+w::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+x::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+y::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+z::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+0::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+1::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+2::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+3::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+4::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+5::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+6::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+7::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+8::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+9::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+[::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+]::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+;::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+'::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+,::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+.::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+/::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+=::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+-::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return
;~*+\::
    ;g_AbortSendLParen := true
    ;g_AbortSendRParen := true
    ;return

LWin & M::

WinGet Style, Style, A
if(Style & 0xC40000) {
WinSet, Style, -0xC40000, A
WinMaximize, A
} else {
WinSet, Style, +0xC40000, A
WinRestore, A
}
return

;Trying this again, it seems like a nice power tool that I'd like to be able to use
~LShift::
	KeyWait, LShift
	If (A_TimeSinceThisHotkey < 200 and A_PriorKey = "LShift") {
		Send, (
	}
return

~RShift::
	KeyWait, RShift
	If (A_TimeSinceThisHotkey < 200 and A_PriorKey = "RShift") {
		Send, )
	}
return
