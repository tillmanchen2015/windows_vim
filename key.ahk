;os type. 0:windows  1:linux
os := 0
;0:insert mode in windows 
;1:normal mode in windows
mode := 0

CAPSLOCK & 8::
os := os + 1
os := Mod(os, 2)
if (os = 1)
{
    MsgBox switch to linux keyboard!
}
if (os = 0)
{
    MsgBox switch to windows keyboard
}
return

;linux use caps as esc
#If (os = 1)
CAPSLOCK::
Send {Esc}
return
#If

;windows use caps to switch mode
#If (os = 0)
;switch mode
CAPSLOCK::
mode := 1
return
#If

;open powershell
CAPSLOCK & 7::#1

#Left::
return
#Right::
return

;max window
CAPSLOCK & u::#Up
CAPSLOCK & i::#Down
  
;close tab 
CAPSLOCK & o::^w
;close app
CAPSLOCK & p::!F4

;new capslock
!0::CAPSLOCK

#If (mode = 1 and os = 0)
;arrow remap
h::Left
j::Down
k::Up
l::Right

;delete
d::Delete

f::^Delete

;i
i::
mode := 0
return

;backspace
s::Backspace

;delete line
;D::
;Send {Home}
;Send +{End}
;Send ^x
;Send {Delete}
;return

;copy
y::^c

;copy line
;Y::
;Send {Home}
;Send +{End}
;Send ^c
;return

;paste
p::
Send %clipboard%
return

;u
u::^z

;vim o
o::
Send {End}
Send {Enter}
return

;vim O
;Send {Up}
;Send {End}
;Send {Enter} 
;return

;vim w
w::^Right
;vim b
b::^Left

a::^a

s::
if (mode = 0)
{
    MsgBox it's insert mode!
}
if (mode = 1)
{
    MsgBox it's normal mode!
}
return

x::^x

n::Home 
m::End 
#If


