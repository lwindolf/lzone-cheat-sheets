If you are maintaining a Linux Glib-based or GTK application for some
time you might want to migrate it to the [XDG way](https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html)
of user data layout. This is something I had to do for [Liferea](https://lzone.de/liferea) (around
since 2003) recently. Also when creating a new application you might ask
yourself where to put the user data. This post tries to describe how to
access the correct paths using Glib.

## 1. Preparation: Categorize your data

Determine what types of data you have. The specification knows three
major directories:

1. `$XDG_DATA_HOME`: usually `~/.local/share`
2. `$XDG_CONFIG_HOME`: usually `~/.config`
3. `$XDG_CACHE_HOME`: usually `~/.cache`

In each of the directories your application should create a subfolder
with the unique name of the application and place relevant files there.
While volatile cache files go into `~/.cache`, persistent important data
should go to `~/.local/share` and all configuration to `~/.config`.

## 2. Migrate the code

The simple task is to rewrite the old code creating directory paths some
arbitrary way to use XDG style directory paths now. As the specification
is non-trivial when finding the directory base paths (via multiple paths
in `$XDG_DATA_DIRS` and `$XDG_CONFIG_DIRS`) it might be good to rely
on a library for doing this.

### 2.1 Using Glib

When developing for GTK or maybe only using Glib one already gets
support since GTK uses Glib and Glib 2.6 introduced support for the XDG
base directory specification. So with Glib use the following methods to
find the target directories:

  | Directory          | Method
  | ------------------ | ----------------------------
  | `$XDG_DATA_HOME`   | `g_get_user_data_dir()`
  | `$XDG_CONFIG_HOME` | `g_get_user_config_dir()`
  | `$XDG_CACHE_HOME`  | `g_get_user_cache_dir()`

Given your application being named "coolApp" and you want to create a
cache file named "render.dat" you could use the following C snippet:

    g_build_filename (g_get_user_cache_dir (), "coolApp", "render.dat", NULL);

to produce a path. Most likely you'll get something like
`/home/joe/.cache/coolApp/render.dat`.

### 2.2 Using wxWidgets

When programming for wxWidgets you need to use the [wxStandardPaths class](http://docs.wxwidgets.org/2.8/wx_wxstandardpaths.html). The
methods are

  Directory          | Method
  ------------------ | ------------------------------------
  `$XDG_DATA_HOME`   | wxStandardPaths::GetDataDir()
  `$XDG_CONFIG_HOME` | wxStandardPaths::GetConfigDir()
  `$XDG_CACHE_HOME`  | wxStandardPaths::GetLocalDataDir()

### 2.3 With KDE

Since KDE 3.2 it also supports the XDG base specification. But honestly:
googling our trying to browse the [KDE API](http://api.kde.org/) I
couldn't find any pointers on how to do it. If you know please leave a
comment!
