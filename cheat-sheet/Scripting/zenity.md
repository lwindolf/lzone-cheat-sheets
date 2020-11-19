## Multipe fields with Zenity

Use parameter "--forms"

    zenity --forms --title="title" \
           --text="Parameters" \
           --add-entry="First param" \
           --add-entry="Second param"
           
Returns value on stdout separated by a pipe "<param 1>|<param 2>"
