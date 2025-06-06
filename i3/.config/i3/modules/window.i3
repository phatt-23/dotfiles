
# assignment of windows to workspaces
assign [class="Spotify"] $ws10
assign [class="ArmCord"] $ws9
assign [class="vesktop"] $ws9 
assign [class="discord"] $ws9 
assign [class="Psst"] $ws10


for_window [class="Thunar"] floating enable
for_window [class="PacketTracer"] floating enable
for_window [class="Com.cisco.secureclient.gui"] floating enable
for_window [class="calculator"] floating enable, resize set 400 600
for_window [class="easyeffects"] floating enable, resize set 800 600
for_window [class="(?i).*Mousepad.*"] floating enable, resize set 800 600
for_window [class="Blueman-manager"] floating enable, resize set 800 600
for_window [class="(?i).*xsensors.*"] floating enable, resize set 400 400
for_window [class="(?i).*ksnip.*"] floating enable
for_window [class="(?i).*Friends List.*"] floating enable
for_window [class="^firefox" window_role="PictureInPicture"] sticky enable



