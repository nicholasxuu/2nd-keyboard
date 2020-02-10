-- Take any extra USB device (keyboard, keypad, etc) and re-assign its keys.
--
-- This uses LuaMacros:
--   website:      http://www.hidmacros.eu/
--   forum:        http://www.hidmacros.eu/forum/
--   download:     http://www.hidmacros.eu/luamacros.zip
--   source code:  https://github.com/me2d13/luamacros/
--
-- See also:
--   https://blog.spiralofhope.com/?p=40598
--   https://blog.spiralofhope.com/?p=41108



-- a) Get LuaMacros.
-- b) Unzip LuaMacros.
-- c) Run LuaMacros.exe.
-- d) Copy this whole script into its editor.
-- e) Read the instructions you just pasted.


print( '-------------' )
lmc_print_devices()
print( '-------------' )

-- to be used as windows startup script
-- create windows shortcut with script like: 
--   C:\bin\luamacros\LuaMacros.exe "C:\bin\2ndkeyboard\simagic_hub_control.lua" -r
-- put shortcut into your startup folder.
-- and enable these 2 lines to hide window after startup.
lmc.minimizeToTray = true
lmc_minimize()

--
-- <unassigned>  :  \\?\HID#VID_13BA&PID_0220&MI_00#A&299458BC&0&0000#{884B96C3-56EF-11D1-BC8C-00A0C91405DD} [31130389] :  keyboard
--

if not usb_device_code_2 then usb_device_code_2='299458BC' end
usb_device_name_2='simagic hub controller'
lmc_device_set_name( usb_device_name_2, usb_device_code_2 )
lmc_set_handler(     usb_device_name_2, function( button, direction )

  if ( direction == 0 ) then return end
  -- This is getting triggered with     qq numlock on.
  -- TODO - handle numlock-enabled items.
  if ( button == 144 ) then return end
  --  Note that <numlock> will not trigger a keystroke.
  -- ^  is  <control>
  -- %  is  <alt>
  -- +  is  <shift>
  -- #  is  <win>
  -- >  is  using the right-side modifier.
  --        e.g.  ^>  is <right-control>
  -- ^>%#  is  <control><right-alt><win>
  is_button_code_assigned = true

  -- panel button - left
  if     ( button == 69  ) then   lmc_send_keys( 'l' ,50 )   key='l'
  -- panel button - right
  elseif ( button == 76  ) then   lmc_send_keys( 'e' ,50 )   key='e'

  -- cruise control - up
  elseif ( button == 89  ) then   lmc_send_keys( 'y' ,50 )   key='y'
  -- cruise control - down
  elseif ( button == 8   ) then   lmc_send_keys( 't' ,50 )   key='t'
  -- cruise control - pull
  elseif ( button == 85  ) then   lmc_send_keys( 'u' ,50 )   key='u'
  -- cruise control - push
  elseif ( button == 73  ) then   lmc_send_keys( 'i' ,50 )   key='i'
  -- cruise control - button
  -- elseif ( button == 67  ) then   lmc_send_keys( 'c' ,50 )   key='c' -- default
  elseif ( button == 67  ) then   lmc_send_keys( '^ ' ,50 )   key='ctrl+space'

  -- light control - up
  elseif ( button == 221 ) then   lmc_send_keys( ']' ,50 )   key=']'
  -- light control - down
  elseif ( button == 219 ) then   lmc_send_keys( '[' ,50 )   key='['
  -- light control - push
  elseif ( button == 74  ) then   lmc_send_keys( 'j' ,50 )   key='j'
  -- light control - pull
  elseif ( button == 75  ) then   lmc_send_keys( 'k' ,50 )   key='k'
  
  -- wiper control - pull
  elseif ( button == 9   ) then   lmc_send_keys( 'r' ,50 )   key='r'
  -- wiper control - down
  elseif ( button == 81  ) then   lmc_send_keys( 'v' ,50 )   key='v'
  -- wiper control - lv1 click1
  elseif ( button == 36  ) then   lmc_send_keys( ',' ,50 )   key=','
  elseif ( button == 103 ) then   lmc_send_keys( ',' ,50 )   key=','
  -- wiper control - lv1 click2
  elseif ( button == 38  ) then   lmc_send_keys( '.' ,50 )   key='.'
  elseif ( button == 104 ) then   lmc_send_keys( '.' ,50 )   key='.'
  -- wiper control - lv1 click3
  elseif ( button == 33  ) then   lmc_send_keys( '/' ,50 )   key='/'
  elseif ( button == 105 ) then   lmc_send_keys( '/' ,50 )   key='/'
  -- wiper control - lv1 click4
  elseif ( button == 107 ) then   lmc_send_keys( 'm' ,50 )   key='m'
  -- wiper control - lv2
  elseif ( button == 80  ) then   lmc_send_keys( 'x' ,50 )   key='x'
  -- wiper control - lv3
  elseif ( button == 145 ) then   lmc_send_keys( 'z' ,50 )   key='z'

  else
    is_button_code_assigned=false
    key=''
  end
  if key ~= '' then
    print( 'The key you pressed has the button code ' .. button .. ' and is the ' .. key .. ' key.' )
  else
    print( 'not identified' .. button )
  end
end)  --  lmc_set_handler



---------------------------------------------------
-- enable lines below for testing un-assigned keys
---------------------------------------------------


-- (Note:  This code is is taken from  https://github.com/me2d13/luamacros/blob/master/src/samples/quickstart.lua)
--lmc_assign_keyboard( 'MACROS' )
--lmc_set_handler(     'MACROS', function( button, direction )
  -- Immediately trigger the macro on downstroke (when the key is pressed).
  -- Does nothing when the key is released back up.
  -- Avoids duplicate keystroke registration.
  -- Enables press and hold behaviour.
  -- direction == 1 is the upstroke (when the is key released back up).
--  if ( direction == 0 ) then return end
--  if is_button_code_assigned == false then
--    print( 'The key you pressed has the button code ' .. button .. ' and it has not been assigned.' )
--    return
--  end
--end)


