# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1,4)
linux_version_formatted=${linux_version//-/ }

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/capacity)
battery_secondary=$(cat /sys/class/power_supply/BAT1/capacity)

output_device=$(pacmd stat | grep "Default sink" | cut -d'-' -f2 | sed 's/_/ /g')
input_device=$(pacmd stat | grep "Default source" | cut -d'-' -f2 | sed 's/_/ /g')

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo ${linux_version_formatted^^} 🐧 $input_device 🎤 $output_device 🔊 $battery_status% / $battery_secondary%  🔋 $date_formatted
