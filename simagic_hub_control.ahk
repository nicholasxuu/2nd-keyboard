;----------------------------------------
; AHK鼠标转向脚本 by 3Rs
; 转向核心代码取自 Zoom377 | https://pastebin.com/wkRZyQem
; CvJoyInterface | https://github.com/evilC/AHK-CvJoyInterface
; AHKHID | https://github.com/jleb/AHKHID
;----------------------------------------

#Persistent
#SingleInstance, Force		; 强制单实例
#NoEnv
SetBatchLines, -1
Thread, interrupt, 0
#KeyHistory 0		; 不保存按键历史记录
#Include %A_ScriptDir%\lib\CvJoyInterface.ahk

vJoyInterface := new CvJoyInterface()

if(!vJoyInterface.vJoyEnabled()){
	MsgBox, % "Error: " . vJoyInterface.LoadLibraryLog
	ExitApp
}
else {
	SoundBeep, 600, 400
	SoundBeep, 500, 400
}

; === 功能开关 ===
; 0=关闭，1=开启
; mouseHideEnabled := 0		; 勿改

; === vJoy设备号 ===
v1 := vJoyInterface.Devices[1]

; === 脚本循环速度 ===
SetTimer, Core_Calculation, 1
return		; 结束初始化

; ============ 开始脚本循环 ============
Core_Calculation:

	key_button_left := GetKeyState("l")
	key_button_right := GetKeyState("e")

	key_light_down := GetKeyState("[")
	key_light_up := GetKeyState("]")
	key_light_pull := GetKeyState("k")
	key_light_push := GetKeyState("j")

	key_cruise_up := GetKeyState("y")
	key_cruise_down := GetKeyState("Backspace") || GetKeyState("t")
	key_cruise_pull := GetKeyState("u")
	key_cruise_push := GetKeyState("i")
	key_cruise_button := GetKeyState("c")

	key_wiper_pull := GetKeyState("Tab") || GetKeyState("r")
	key_wiper_down := GetKeyState("q") || GetKeyState("v")
	key_wiper_s1_c1 := GetKeyState("Numpad7") || GetKeyState(",")
	key_wiper_s1_c2 := GetKeyState("Numpad8") || GetKeyState(".")
	key_wiper_s1_c3 := GetKeyState("Numpad9") || GetKeyState("/")
	key_wiper_s1_c4 := GetKeyState("NumpadAdd") || GetKeyState("m")
	key_wiper_s2 := GetKeyState("p") || GetKeyState("x")
	key_wiper_s3 := GetKeyState("ScrollLock") || GetKeyState("z")

	if (key_button_left = 1)
		v1.SetBtn(1, 1)
	else
		v1.SetBtn(0, 1)
	if (key_button_right = 1)
		v1.SetBtn(1, 2)
	else
		v1.SetBtn(0, 2)
	if (key_light_down = 1)
		v1.SetBtn(1, 3)
	else
		v1.SetBtn(0, 3)
	if (key_light_up = 1)
		v1.SetBtn(1, 4)
	else
		v1.SetBtn(0, 4)
	if (key_light_pull = 1)
		v1.SetBtn(1, 5)
	else
		v1.SetBtn(0, 5)
	if (key_light_push = 1)
		v1.SetBtn(1, 6)
	else
		v1.SetBtn(0, 6)
	if (key_cruise_up = 1)
		v1.SetBtn(1, 7)
	else
		v1.SetBtn(0, 7)
	if (key_cruise_down = 1)
		v1.SetBtn(1, 8)
	else
		v1.SetBtn(0, 8)
	if (key_cruise_pull = 1)
		v1.SetBtn(1, 9)
	else
		v1.SetBtn(0, 9)
	if (key_cruise_push = 1)
		v1.SetBtn(1, 10)
	else
		v1.SetBtn(0, 10)
	if (key_cruise_button = 1)
		v1.SetBtn(1, 11)
	else
		v1.SetBtn(0, 11)
	if (key_wiper_pull = 1)
		v1.SetBtn(1, 12)
	else
		v1.SetBtn(0, 12)
	if (key_wiper_down = 1)
		v1.SetBtn(1, 13)
	else
		v1.SetBtn(0, 13)
	if (key_wiper_s1_c1 = 1)
		v1.SetBtn(1, 14)
	else
		v1.SetBtn(0, 14)
	if (key_wiper_s1_c2 = 1)
		v1.SetBtn(1, 15)
	else
		v1.SetBtn(0, 15)
	if (key_wiper_s1_c3 = 1)
		v1.SetBtn(1, 16)
	else
		v1.SetBtn(0, 16)
	if (key_wiper_s1_c4 = 1)
		v1.SetBtn(1, 17)
	else
		v1.SetBtn(0, 17)
	if (key_wiper_s2 = 1)
		v1.SetBtn(1, 18)
	else
		v1.SetBtn(0, 18)
	if (key_wiper_s3 = 1)
		v1.SetBtn(1, 19)
	else
		v1.SetBtn(0, 19)


return

disableMappedKeys := 0
#k::
	if (disableMappedKeys = 1)
		disableMappedKeys := 0
	else
		disableMappedKeys := 1
return

; setup mode start
#if disableMappedKeys
	l::return
	e::return
	[::return
	]::return
	j::return
	k::return
	y::return
	Backspace::return
	t::return
	u::return
	i::return
	c::return
	Tab::return
	r::return
	q::return
	v::return
	Numpad7::return
	,::return
	Numpad8::return
	.::return
	Numpad9::return
	/::return
	NumpadAdd::return
	m::return
	p::return
	x::return
	ScrollLock::return
	z::return
#if
; setup mode end


; ================================================


#IfWinActive ahk_exe AC2-Win64-Shipping.exe ; 程序限制，以下代码只对此程序有效

#IfWinActive ; 限制结束


; -------- 重新加载脚本 --------
; #x::Reload
return

; -------- 停用脚本 --------
;#c::Suspend Toggle
;return

; -------- 退出脚本 --------
; ^F12::ExitApp
return
