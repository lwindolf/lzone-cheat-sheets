## Combobox entry with default

Note: Defaults are only possible with single-element dialogs. They do not work with "--forms"!

    zenity --entry --title="Choose" --text "Option" --entry-text "optionA" optionA optionB optionC

Pass the possible values as additional parameters and the default with "--entry-text"

## Multipe fields with Zenity

Use parameter "--forms"

    zenity --forms --title="title" \
           --text="Parameters" \
           --add-entry="First param" \
           --add-entry="Second param"
           
Returns value on stdout separated by a pipe "<param 1>|<param 2>"
