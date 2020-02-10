# 2nd-keyboard
2nd keyboard as new device


## Installation

1. Download and install [LuaMacro](https://github.com/stevedonovan/LuaMacro) from [its release page](https://github.com/stevedonovan/LuaMacro/releases/tag/2.5.0)

2. Open LuaMacro.

3. Use `lmc_print_devices()` to find your target device, i.e.
```
<unassigned>  :  \\?\HID#VID_13BA&PID_0220&MI_00#A&299458BC&0&0000#{884B96C3-56EF-11D1-BC8C-00A0C91405DD} [31130389] :  keyboard
```

* Run it without your second keyboard plugged in first, then plug it in, and run it again. The difference is your second keyboard.

* This ID changes when your unplug your keyboard, turning PC on/off won't change it, but you'll need to update the value when USB unplugged.

4. Take the `299458BC` betweeen `#A&` and `&0&0000` (similar pattern) as your device ID.

5. Update ID value `299458BC` to yours in the script

6. Test the script, load the script, and run it. (it may be minimized to tray when ran)

7. If it works, you can create a windows startup with next few steps:

 7.1. Create windows shortcut with script like: `"C:\bin\luamacros\LuaMacros.exe" "C:\bin\2ndkeyboard\simagic_hub_control.lua" -r`. Your directories may differ. 
 
 
 7.2. Put shortcut into your startup folder.
