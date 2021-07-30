## Video Editing

### Cropping

The following will create a 640x480 sized output video by copying a corresponding window at offset x=100px y=25px from the input video

    ffmpeg -i <input> -filter:v "crop=640:480:100:25" <output>
    
### Scaling

    ffmpeg -i <input> -vf scale=640:480 <output>
    
### Cutting a video part

    ffmpeg -i <input> -ss 00:01:45 -t 00:02:35 -vcodec copy -acodec copy <output>ffmpeg -ss 00:00:30 -i orginalfile.mpg -t 00:00:05 -vcodec copy -acodec copy newfile.mpg

## Repacking

### Extracting Audio Stream

Combine "-vn" (for no video) with "-acodec copy". Note that the output file 
extension must match the audio codec in the input file for "-acodec copy" to
work.

    ffmpeg -i file.mp4 -vn -acodec copy output.aac 
    
    
### Creating Thumbnails

To create thumbnails every n seconds use "-vf fps=1/n" for example

    ffmpeg -i <input file> -vf fps=1/60 thumbnails/thumb%03d.png

### Resample/Convert Audio

    ffmpeg -i file.aac -acodec mp3 -ar 44100 -ab 128000 output.mp3

### Switching Containers

Change container from MKV to MP4

    ffmpeg -i file.mkv -acodec copy -vcodec copy file.mp4

### Video from Images

If you have multiple numbered images image1.jpg, image2.jpg... create a video from them like this

    ffmpeg -f image2 -i image%d.jpg video.mp4

### Split Video to Images

    ffmpeg -i video.mp4 image%d.jpg

## Codec Issues

### AAC: "channel element not allocated"

**Update:** The workaround for the problem doesn't work for ffmpeg
versions more recent than 20.06.2011 as libfaad support was dropped in
favour of the now stable native ffmpeg AAC encoder! If you still have a
separate compilation of libfaad you can workaround using the "faad"
encoder tool as described in the next section. If you are using recent
ffmpeg versions to decode a .MOV file you might get the [following
error](http://n4.nabble.com/error-when-downscaling-mp4-td940675.html):

    Stream #0.0(eng): Audio: aac, 48000 Hz, 2 channels, s16
    Stream #0.1(eng): Video: h264, yuv420p, 1280x530, PAR 1:1 DAR 128:53, 25 tbr, 25 tbn, 50 tbc
    Output #0, flv, to 'test.flv':
    Stream #0.0(eng): Video: flv (hq), yuv420p, 400x164 [PAR 101:102 DAR 050:2091], 
    q=2-31, 300 kb/s, 1k tbn, 25 tbc
    Stream #0.1(eng): Audio: libmp3lame, 22050 Hz, 2 channels, s16, 64 kb/s
    Stream mapping:
    Stream #0.1 -> #0.0
    Stream #0.0 -> #0.1
    Press [q] to stop encoding
    [aac @ 0x80727a0]channel element 1.0 is not allocated
    Error while decoding stream #0.0
    Error while decoding stream #0.0
    Error while decoding stream #0.0
    Error while decoding stream #0.0
    Error while decoding stream #0.0
    Error while decoding stream #0.0
    [...]

The message "Error while decoding stream \#0.0" is repeated
continuously. The resulting video is either unplayable or has no sound.
Still the input video is playable in all standard players (VLC, in
Windows...). The reason for the problem as I understood it is that the
ffmpeg-builtin AAC codec cannot handle an audio stream stream with index
"1.0". This is documented in various bugs (see ffmpeg issues
[\#800](https://roundup.ffmpeg.org/roundup/ffmpeg/issue800),
[\#871](https://roundup.ffmpeg.org/roundup/ffmpeg/issue871),
[\#999](https://roundup.ffmpeg.org/roundup/ffmpeg/issue999),
[\#1733](https://roundup.ffmpeg.org/roundup/ffmpeg/issue1733)...). It
doesn't look like this will be handled by ffmpeg very soon. In fact it
could well be that they'll handle it as an invalid input file.
**Solution:** Upgrade to latest ffmpeg and faad library version and add
" -acodec libfaad " in front of the "-i" switch. This uses the libfaad
AAC decoder, which is said to be a bit slower than the ffmpeg-builtin,
but which decodes the AAC without complaining. For example:

    ffmpeg -acodec libfaad -i input.mov -b 300kbit/s -ar 22050 -o test.flv

The "-acodec" preceding the "-i" option only influences the input audio
decoding, not the audio encoding.

### AAC: "Can not resample 6 channels"

When you try to encode with ffmpeg and you end up with such an error

    Resampling with input channels greater than 2 unsupported.
    Can not resample 6 channels @ 48000 Hz to 6 channels @ 48000

you are probably trying to encode from AAC with 5.1 audio to less than 6
channels or different audio sampling rate. There are three solutions:

1.  As a solution either do not reduce the audio channels and change the
    audio sampling rate or do convert the audio with faad first.
2.  Apply one of the available ffmpeg patches to fix the AAC 6 channel
    issue...
3.  Split video and audio and convert audio separately.

The third solution can be done as following:

1.  Extract audio with ffmpeg:

        ffmpeg -y -i source.avi -acodec copy source.6.aac

2.  Convert audio with faad:

        faad -d -o source.2.pcm source.6.aac

3.  Merge video and audio again with ffmpeg:

        ffmpeg -y -i source.avi -i source.2.pcm -map 0:0 -map 1:0 -vcodec copy -acodec copy output.avi

**Update**: As hinted by a fellow commenter the big disadvantage is the
quality loss as faad can only convert into PCM 16bit.

## Fixing Async Video

### Correcting Audio that is too slow/fast

This can be done using the ["-async" switch](http://ffmpeg-users.933282.n4.nabble.com/async-td935787.html) of
ffmpeg which according to the documentation *"Stretches/squeezes" the
audio stream to match the timestamps*. The parameter takes a numeric
value for the samples per seconds to enforce. Example:

    ffmpeg -async 25 -i input.mpg <encoding options> -r 25

Try slowly increasing the -async value until audio and video matches.

### Correcting Time-Shift (Variant 1)

Case 1: Audio ahead of video: As a special case the "-async" switch
auto-corrects the start of the audio stream when passed as "-async 1".
So try running

    ffmpeg -async 1 -i input.mpg <encoding options>

Case 2: Audio behind video: Instead of using "-async" you need to use
"-vsync" to drop/duplicate frames in the video stream. There are two
methods in the manual page "-vsync 1" and "-vsync 2" and an method
auto-detection with "-vsync -1". But using "-map" it is possible to
specify the stream to sync against. Interestingly Google shows people
using -aync and -vsync together. So it might be worth experimenting a
bit to achieve the intended result :-)

### Correcting Time-Shift (Variant 2)

If you have a constantly shifted sound/video track that the previous fix
doesn't work with, but you know the time shift that needs to be
corrected, then you can easily fix it with one of the following two
commands: Case 1: Audio ahead of video:

    ffmpeg -i input.flv -itsoffset 00:00:03.0 -i input.flv -vcodec copy -acodec copy -map 0:1 -map 1:0 output_shift3s.flv

Case 2: Audio behind video:

    ffmpeg -i input.flv -itsoffset 00:00:03.0 -i input.flv -vcodec copy -acodec copy -map 1:0 -map 0:1 output_shift3s.flv

The difference is in the mapping parameters which specify which of the
two supplied input files to map on which output channel. The
"-itsoffset" option indicates an offset (3 seconds in the example) for
the following input file. The input file is required to have exactly one
video channel at position 0 and one audio channel at position 1. I added
"-vcodec copy -acodec copy" to avoid reencoding the video and loose
quality. These parameters need to be added after the second input file
and before the mapping options. Otherwise one runs into mapping errors.
**Update:** Also check the comment of an anonymous user below mentioning
that he needed a different mapping with a more recent version of ffmpeg.
The commands above were tested using ffmpeg 0.5/0.6

## Frame Exact Splitting

When preparing videos for Apples HTTP streaming for iPad/iPhone you need
to split your video into 10s chunks and provide a play list for
Quicktime to process. The problem lies with frame exact splitting of
arbitrary video input material. Wether you split the file using
[ffmpeg](http://ffmpeg.org) or the [Apple segmenter
tool](http://www.espend.de/artikel/iphone-ipad-ipod-http-streaming-segmenter-and-m3u8-windows.html)
you often end up with

-   asynchronous audio in some or all segments
-   missing video frames at the start of each segment
-   audio glitches between two segements
-   missing audio+video between otherwise audio-synchronous consecutive
    segments

When using the Apple segmenter the only safe way to split files is to
convert into an intermediate format which allows frame-exact splitting.
As the segmenter only supports transport stream only MPEG-2 TS and
MPEG-4 TS do make sense. To allow frame-exact splitting on problematic
input files the easiest way is to blow them up to consist only of
I-frames. The parameter for this depends on the output video codec. An
ffmpeg command line for MPEG-2 TS can look like this:

    ffmpeg -i inputfile -vcodec mpeg2video -pix_fmt yuv422p -qscale 1 -qmin 1 -intra outputfile

The relevant piece is the "-intra" switch. For MPEG-4 TS something like
the following should work:

    ffmpeg -i inputfile -vcodec libx264 -vpre slow -vpre baseline -acodec libfaac -ab 128k -ar 44100 -intra -b 2000k -minrate 2000k -maxrate 2000k outputfile

Note: It is important to watch the resulting muxing overhead which might
lower the effective bitrate a lot! The resulting output files should be
safe to be passed to the Apple segmenter.

## Metadata Tagging Tools

This is a comparison of the performance of different tools
for MP4 tagging. Here you can select between a lot of tools from
the net, but only a few of them are command line based and available for
Unix. The MP4 test file used is 100MB large.

| Name | Duration | Command   | 
| ---- | -------- | ----------|
| [AtomicParsely](http://atomicparsley.sourceforge.net/) |  0.6s |      AtomicParsley test.mp4 --artist "Test" --genre "Test" --year "1995"
|  [mp4box](http://www.videohelp.com/tools/mp4box)       |  0.6s |      MP4Box -itags Name=Test:Artist=Me:disk=95/100 test.mp4
|  [ffmpeg 0.6](http://ffmpeg.org)                       |  0.8s |     ffmpeg -i test.mp4 -metadata title="Test" -metadata artist="Test" -metadata date="1995" -acodec copy -vcodec copy test2.mp4

### Solving Runtime Errors

#### av\_interleaved\_write\_frame() I/O error

If you are unlucky you might see the following ffmpeg error message:

    Output #0, image2, to 'output.ppm':
    Stream #0.0: Video: ppm, rgb24, 144x108, q=2-31, 200 kb/s, 90k tbn, 29.97 tbc
    Stream mapping:
    Stream #0.0 -> #0.0
    Press [q] to stop encoding
    av_interleaved_write_frame(): I/O error occurred

Usually that means that input file is truncated and/or corrupted. The
above error message was produced with a command like this

    ffmpeg -v 0 -y -i 'input.flv' -ss 00:00:01 -vframes 1 -an -sameq -vcodec ppm -s 140x100 'output.ppm'

There are several possible reasons for the error message
"av\_interleaved\_write\_frame(): I/O error occurred".

1.  You are extracting a thumb and forgot to specify to extract a single
    frame only (-vframes 1)
2.  You have a broken input file.
3.  And finally: The target file cannot be written.

The above was caused by problem three. After a lot of trying I found
that the target directory did not exist. Quite confusing.

## Compilation Issues

### x264: sched\_getaffinity()

If compilation fails with an error about the numbers of parameters in
common/cpu.c you need to check which glibc version is used. Remove the
second parameter to sched\_getaffinity() if necessary and recompile.

### x264: Linking

ffmpeg configure fails with:

    ERROR: libx264 not found
    If you think configure made a mistake, make sure you are using the latest
    version from SVN.  If the latest version fails, report the problem to the
    ffmpeg-user@mplayerhq.hu mailing list or IRC #ffmpeg on irc.freenode.net.
    Include the log file "config.err" produced by configure as this will help
    solving the problem.

This can be caused by two effects:

-   Unintended library is used for linking. Check wether you have
    different ones installed. Avoid this and uninstall them if possible.
    If necessary use LD\_LIBRARY\_PATH or --extra-ldflags to change the
    search order.
-   Incompatible combination of ffmpeg and libx264. Older libx264
    provide a method x264\_encoder\_open which older ffmpeg versions do
    check for. More recent libx264 add a version number to the method
    name. Now when you compile a new libx264 against an older ffmpeg the
    libx264 detection that relies on the symbol name fails. As a
    workaround you could hack the configure script to check for
    "x264\_encoder\_open\_78" instead of "x264\_encoder\_open" (given
    that 78 is the libx264 version you use).

### x264: AMD64

ffmpeg compilation fails on AMD64 with:

    libavcodec/svq3.c: In function 'svq3_decode_slice_header':
    libavcodec/svq3.c:721: warning: cast discards qualifiers from pointer target type
    libavcodec/svq3.c:724: warning: cast discards qualifiers from pointer target type
    libavcodec/svq3.c: In function 'svq3_decode_init':
    libavcodec/svq3.c:870: warning: dereferencing type-punned pointer will break strict-aliasing rules
    /tmp/ccSySbTo.s: Assembler messages:
    /tmp/ccSySbTo.s:10644: Error: suffix or operands invalid for `add'
    /tmp/ccSySbTo.s:10656: Error: suffix or operands invalid for `add'
    /tmp/ccSySbTo.s:12294: Error: suffix or operands invalid for `add'
    /tmp/ccSySbTo.s:12306: Error: suffix or operands invalid for `add'
    make: *** [libavcodec/h264.o] Error 1

This [post](https://www.x86-64.org/pipermail/bugs/2001-May/000397.html)
explains that this is related to a glibc issue and how to patch it.

### x264: x264\_init

ffmpeg compilation fails with:

    libavcodec/libx264.c: In function 'encode_nals':
    libavcodec/libx264.c:60: warning: implicit declaration of function 'x264_nal_encode'
    libavcodec/libx264.c: In function 'X264_init':
    libavcodec/libx264.c:169: error: 'x264_param_t' has no member named 'b_bframe_pyramid'
    make: *** [libavcodec/libx264.o] Error 1

This means you are using incompatible ffmpeg and libx264 versions. Try
to upgrade ffmpeg or to downgrade libx264.

### video4linux

    /usr/include/linux/videodev.h:55: error: syntax error before "ulong"
    /usr/include/linux/videodev.h:71: error: syntax error before '}' token

Workaround:

    --- configure.ac.080605 2005-06-08 21:56:04.000000000 +1200
    +++ configure.ac        2005-06-08 21:56:42.000000000 +1200
    @@ -1226,6 +1226,7 @@
     AC_CHECK_HEADERS(linux/videodev.h,,,
     [#ifdef HAVE_SYS_TIME_H
     #include <sys/time.h>
    +#include <sys/types.h>
     #endif
     #ifdef HAVE_ASM_TYPES_H
     #include <asm/types.h>

http://www.winehq.org/pipermail/wine-devel/2005-June/037400.html oder
Workaround: --disable-demuxer=v4l --disable-muxer=v4l
--disable-demuxer=v4l2 --disable-muxer=v4l2

### Old make

    make: *** No rule to make target `libavdevice/libavdevice.so', needed by `all'.  Stop.

Problem: GNU make is too old, you need at least v3.81
http://www.mail-archive.com/ffmpeg-issues@live.polito.it/msg01284.html

    make: *** No rule to make target `install-libs', needed by `install'.  Stop.

Problem: GNU make is too old, you need at least v3.81
http://ffmpeg.arrozcru.org/forum/viewtopic.php?f=1&t=833
