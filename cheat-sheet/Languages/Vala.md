## Compiling

     valac myfile.vala
     valac -v myfile.vala                                 # Verbose output
     
     valac --pkg json-glib-1.0 --pkg gtk+-3.0 *.vala      # Link to JSON and GTK libs
     valac --vapidir=src --pkg MyNamespace *.vala         # Link to VAPI in your source
     
     valac --gir=Gtk-3.0 *.vala                           # Compile with GObject Introspection bindings
     valac --girdir=src --gir MyNamespace-1.0.gir *.vala  # Compile against your own GObject Introspection bindings
     
## Creating Bindings

3rd party libraries that use GObject can be used via their .gir bindings. While they can be used directly 
(using "--gir" when compiling) Vala's native mechanism is .vapi bindings.

To create a VAPI binding:

     vapigen --library MyNamespace src/MyNamespace-1.0.gir

If you have conflicts in .gir dependencies try to directly include the VAPI bindings instead (using "--pkg")
For example:

     vapigen --pkg=Gtk-3.0 --library MyNamespace src/MyNamespace-1.0.gir

## Find Available Bindings
     
     find /usr/share/vala*/vapi/ -name "*.vapi"
