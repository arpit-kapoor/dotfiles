
#!/bin/sh
# Toggle on/off an thirdal monitor, HDMI does not support audio over HDMI as it's pretending that it's DVI

main="eDP1"
second="HDMI-1-0"

extramonitor() {
  case "$1" in
      "disconnect") xrandr --output "$second"  --off --output "$main" --primary --auto ;;
      "extra") xrandr --output "$second" --mode 1920x1080 && xrandr --output "$main" --auto --output "$second" --primary --left-of "$main" ;;
      "duplicate") xrandr --output "$second"  --mode 1920x1080 && xrandr --output "$main" --primary --auto --output "$second" --same-as "$main" ;;
      *) notify-send "Multi Monitor" "Unknown Operation" ;;
  esac
}

extramonitor "$1"
