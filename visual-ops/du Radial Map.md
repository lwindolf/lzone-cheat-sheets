--- 
jsfiddle: azd0yx3L
---
Accepts input from

     cd /usr/share/fonts; (find . -maxdepth 3 -type d -print0 | xargs -0 -n1 du -sm | sort -nr ) 2>/dev/null
     
A radial map for directory usage in MB
- Zoom in by clicking a node in the inner ring
- Zoom out by clicking in the middle
