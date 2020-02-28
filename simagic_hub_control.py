from ctypes import *
user32 = windll.user32 # 调用鼠标锁定功能所需库

if starting:
	# 功能开关
	vjoyaxis = False # 转向轴与踏板开关
	mouselock = False # AC鼠标位置锁定（隐藏）专属开关（这里不要修改，后面可以设置开关快捷键）
	# 映射vJoy设备号
	v = vJoy[0]
	
#======== 键位映射 ========#
# 车辆控制
key_button_left = keyboard.getKeyDown(Key.L)
key_button_right = keyboard.getKeyDown(Key.E)

key_light_down = keyboard.getKeyDown(Key.LeftBracket)
key_light_up = keyboard.getKeyDown(Key.RightBracket)
key_light_pull = keyboard.getKeyDown(Key.K) 
key_light_push = keyboard.getKeyDown(Key.J)

key_cruise_up = keyboard.getKeyDown(Key.Y)
key_cruise_down = keyboard.getKeyDown(Key.Backspace) or keyboard.getKeyDown(Key.T)
key_cruise_pull = keyboard.getKeyDown(Key.U)
key_cruise_push = keyboard.getKeyDown(Key.I)
key_cruise_button = keyboard.getKeyDown(Key.C)

key_wiper_pull = keyboard.getKeyDown(Key.Tab) or keyboard.getKeyDown(Key.R)
key_wiper_down = keyboard.getKeyDown(Key.Q) or keyboard.getKeyDown(Key.V)
key_wiper_s1_c1 = keyboard.getKeyDown(Key.NumberPad7) or keyboard.getKeyDown(Key.Comma)
key_wiper_s1_c2 = keyboard.getKeyDown(Key.NumberPad8) or keyboard.getKeyDown(Key.Period)
key_wiper_s1_c3 = keyboard.getKeyDown(Key.NumberPad9) or keyboard.getKeyDown(Key.Slash)
key_wiper_s1_c4 = keyboard.getKeyDown(Key.NumberPadPlus) or keyboard.getKeyDown(Key.M)
key_wiper_s2 = keyboard.getKeyDown(Key.P) or keyboard.getKeyDown(Key.X)
key_wiper_s3 = keyboard.getKeyDown(Key.ScrollLock) or keyboard.getKeyDown(Key.Z)

#======== vjoy 轴与按钮映射（勿随便修改） ========#
v.setButton(0, key_button_left)
v.setButton(1, key_button_right)
v.setButton(2, key_light_down)
v.setButton(3, key_light_up)
v.setButton(4, key_light_pull)
v.setButton(5, key_light_push)
v.setButton(6, key_cruise_up)
v.setButton(7, key_cruise_down)
v.setButton(8, key_cruise_pull)
v.setButton(9, key_cruise_push)
v.setButton(10, key_cruise_button)
v.setButton(11, key_wiper_pull)
v.setButton(12, key_wiper_down)
v.setButton(13, key_wiper_s1_c1)
v.setButton(14, key_wiper_s1_c2)
v.setButton(15, key_wiper_s1_c3)
v.setButton(16, key_wiper_s1_c4)
v.setButton(17, key_wiper_s2)
v.setButton(18, key_wiper_s3)
