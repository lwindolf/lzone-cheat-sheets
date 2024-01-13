--- 
jsfiddle: keu9hxmd
---
Accepts input from

     cd /usr/lib && (find . -maxdepth 5 -type d -print0 | xargs -0 -n1 du -sm | sort -nr ) 2>/dev/null
     
A tree map for directory usage in MB
- Zoom in by clicking darker shaded nodes
- Zoom out by clicking the graph title
