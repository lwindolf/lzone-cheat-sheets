---
related:
  cheat-sheet: ['gdb', 'GObject']
---

## Debugging

    // Delta-debugging...
    g_print ("Some string\n");
    g_printf ("Cannot open file %s\n", filename);

    g_warning ("Some warning");
    g_error ("Some error");

Enable fatal warnings/criticals and other checks

    # Stop on assertions:
    export G_DEBUG=fatal_warnings
    export G_DEBUG=fatal_criticals

    # Logging from all glib based libraries
    export G_MESSAGES_DEBUG=all

    # Check memory allocation 
    export G_SLICE=debug-blocks

## Data Types

### Strings

    gchar *s = "static";
    s = g_strdup ("copy");
    s = g_strdup_printf ("on the fly format: %s %d", s2, i);

    g_free (s);

### String Replace

{% raw %}
Split text separated by literal ";;;" and join fields using new separator "|||"

    char **split = g_strsplit(text, ";;;", -1);
    g_free(text);
    text = g_strjoinv("|||", split);
    g_strfreev(split);
{% endraw %}

### String Buffer

    GString *s = g_string_new ();

    g_string_assign (s, "new value");
    g_string_printf (s, "new value %s", s2);
    g_string_prepend (s, "prefix");
    g_string_append (s, "additional text");
    g_string_append_printf (s, "additional text %s", s2);

    g_string_append_uri_escaped (s, "q=some search string", NULL, FALSE);

    g_string_free (s);

### Arrays

    GArray *a = g_array_new (FALSE, FALSE, sizeof (gint));

    gint index = 17;
    gint value = 55;

    // Writing
    g_array_append_val (a, value);
    g_array_insert_val (a, index, value);
    g_array_remove_index (a, index);

    // Reading
    gint i = &g_array_index (a, gint, index);

    g_array_free (a, FALSE);

## File System

### Get XDG paths

    g_get_user_config_dir ()
    g_get_user_data_dir ()
    g_get_user_cache_dir ()

### Filenames

    g_strdup_printf ("%s%s%s", directory, G_DIR_SEPARATOR_S, filename);

### Check for file

    if (g_file_test (filename, G_FILE_TEST_EXISTS)) {
        // File exists.
    }

### Read file

    gsize length;
    gchar *content, *filename = "input.txt";
    if (g_file_get_contents (filename, &content, &length, NULL)) {
        // Process contents
        g_free (content);
    }

### Write files

    g_file_set_contents (backupFilename, content, length, NULL);

## GSettings (DConf)

General usage:

    GSettings *settings = g_settings_new ("org.myproject");

    g_signal_connect (
        settings,
        "changed::some-setting",
        G_CALLBACK (some_settings_cb),
        NULL
    );

    gboolean b = g_settings_get_boolean (settings, key);
    gchar *s = g_settings_get_string (settings, key);
    gint i = g_settings_get_int (settings, key);

    g_settings_set_boolean (settings, key, b);
    g_settings_set_string (settings, key, s);
    g_settings_set_int (settings, key, i);

### DConf - CLI

    # Print a key value
    gsettings get org.gnome.liferea browser

    # Set a key value
    gsettings set net.sf.liferea browser 'firefox %s'

    # Print subtree (mandatory trailing slash!)
    dconf dump /apps/liferea/

    # Dump and Restore non-default values
    dconf dump /apps/liferea/  >liferea.dump
    dconf load liferea.dump

    # Reset a single key to schema default
    dconf reset /apps/liferea/last-window-height

    # Reset an entire tree to schema
    dconf reset -f /apps/liferea/

### GConf - CLI (Legacy)

    # Print a key's schema
    gconftool-2 --get /schemas/apps/liferea/browser

    # Print a key value
    gconftool-2 --get /apps/liferea/browser

    # Set a key
    gconftool-2 --type Boolean --set /desktop/gnome/peripherals/mouse/touchpad_enabled false

### GConf/DConf Migration

Testing for GConf -\> DConf schema migration:

    cd /usr/share/GConf/gsettings
    # Here you find .convert files per application

    # Check for conversion using 
    gsettings-data-convert --verbose --dry-run <.convert file name> 
    
## GTK Inspector

Enable GTK Inspector by configuring the following setting:

    gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
    
Some GNOME core apps now have a "Help" menu entry to start the inspector. Alternatively launch the inspector by pressing Ctrl-Shift-I or Crtl-Shift-D
    
Or explicitely start the application with open inspector

    GTK_DEBUG=interactive <program>
