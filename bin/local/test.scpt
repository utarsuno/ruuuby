
-- do shell script "screencapture -x -R0,2361,0789,0200 -tpng save_path_here"

tell application "iTerm2"
    set cmd to "./bin/audit_quick"
    tell application "System Events"
        keystroke cmd
        keystroke return
    end tell
    do shell script "afplay " & "song_file_path_here" & "&>/dev/null &"
end tell
