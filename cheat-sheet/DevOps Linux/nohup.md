## Usage

     nohup <command> &
     nohup <command> >/dev/null 2>&1     # to drop all output and avoid nohup.out

## Disowning

If the process dies on terminal close despite nohup, use disown

     nohup <command> &
     disown

You can check wether this is needed using

     nohup <command> &
     grep SigIgn /proc/$!/status
     
If the last bit of the SigIgn value bitmask is set then it is fine. Otherwise use disown.
