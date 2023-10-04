Cheat sheet about the Android Debug Bridge (ADB)

## CLI commands

    adb devices             # List connected devices
    adb shell               # Get interactive shell on phone

    adb connect <ip>        # Connect to specific phone
    adb install <apk>       # Install .apk file
    adb push <local file> <Android path>
    adb pull <remote file>

    adb shell dumpsys       # Dump full system info
    adb logcat              # Tail phone log

## Screen Capture

    adb shell screencap   -p <path>   # Make screenshot
    adb shell screenrecord <path>     # Make video

## Accessing package manager 

    adb shell cmd package help             # Help
    adb shell cmd package list packages
    adb shell cmd package list libraries
    adb shell cmd package list features
    adb shell cmd package list users
