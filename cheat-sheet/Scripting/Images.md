This sheet cheat is about manipulating images (as in pictures).

## ImageMagick

In the commands below <input> is the name of the input file and output of the output file to be created

### Resizing

    convert <input> -resize 2000x1000 <output>     # Target image will fit in 2000x1000 (but might be smaller, keeps aspects)
    convert <input> -resize 2000x     <output>     # Target image will be 2000px wide (keeps aspect ratio)
    convert <input> -resize x1000     <output>     # Target image will be 1000px high (keeps aspect ratio)
    convert <input> -resize 640x480!  <output>     # Target image will be exactly 640x480 (changes aspect ratio)

### Rotation

    convert <input> -rotate 90 <output>     # Rotates 90° clockwise
    
### Lossy Encoding

To optimize PNG/JPG images for size lower the quality like this

    convert <input> -quality 80 <output>

or when downscaling PNG/JPG you might enforce a high quality like this

    convert <input> -resize <size> -quality 95 <output>
    
