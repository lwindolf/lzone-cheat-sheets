This cheat sheet covers scripting video conversion.

## ffmpeg

### Inspect video

    ffmpeg -i <input>

### Converting MPEG2 video to H265

For old MPEG2 videos it is often just enough to recode them with automatic bitrate to lower the file size

    ffmpeg -i <input>.MPG -acodec aac -vcodec libx265 <output>.mp4

### H265 2-pass encoding 

For H265 2-pass encoding you need to combine 2 ffmpeg calls. Example from ffmpeg:

    ffmpeg -y -i input -c:v libx265 -b:v 2600k -x265-params pass=1 -an -f mp4 /dev/null && \
    ffmpeg    -i input -c:v libx265 -b:v 2600k -x265-params pass=2 -c:a aac -b:a 128k output.mp4

### Fixing rotation

Do not recode for rotation but simple add a video metadate field for the rotation angle

    ffmpeg -i <input> -c copy -metadata:s:v:0 rotate=90 <output>

## Misc

- [H265 Encoder Hints](https://trac.ffmpeg.org/wiki/Encode/H.265)
