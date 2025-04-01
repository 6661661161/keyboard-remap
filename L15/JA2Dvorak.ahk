#Requires AutoHotkey v2.0

; 日本語キーボード (JA109) を Dvorak (US) に変更

; 数字キー（シフトなし / シフトあり）
;1::1
;2::2
;3::3
;4::4
;5::5
;6::6
;7::7
;8::8
;9::9
;0::0
-::[
^::]

;+1::!
+2::@
;+3::#
;+4::$
;+5::%
+6::^
+7::&
+8::*
+9::(
+0::)


; 上段（QWERTY → Dvorak）
q::'
w::,
e::.
r::p
t::y
y::f
u::g
i::c
o::r
p::l
@::/
[::=

+q::"
;+w::<
;+e::>
+[::+

; 中段（QWERTY → Dvorak）
;a::a
s::o
d::e
f::u
g::i
h::d
j::h
k::t
l::n
`;::s
sc28::- ; sc28 = :
$]::Send "+@" ; "+@" = `

+sc28::_ ; sc28 = :
+]::~

; 下段（QWERTY → Dvorak）
z::`;
x::q
c::j
v::k
b::x
n::b
m::m
,::w
.::v
/::z
sc73::Send "+@" ; sc73 = ro , "+@" = `

+z:::
+sc73::~ ; sc73 = ro
