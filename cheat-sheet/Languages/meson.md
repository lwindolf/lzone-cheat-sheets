## CLI Usage

Standard build commands

     cd /path/to/source/root
     meson builddir && cd builddir
     
     meson compile
     meson test
     meson install
     
     ninja
     ninja test
     
More on http://mesonbuild.com/Quick-guide.html

## meson.build Examples

Define project

     project('myproject', 'c',
       version: '0.0.1',
       license: 'GPL3+',
       meson_version: '>=0.42.0')

Import modules, for example gettext and GNOME

     i18n = import ('i18n')
     gnome = import ('gnome')

Define dependencies

     myproject_deps = [
       dependency ('gtk+-3.0', version : '>= 3.24'),
       dependency ('glib-2.0', version : '>= 2.68'),
       dependency ('gmodule-2.0')
     ]

Allow for --prefix compile option

     prefix = get_option ('prefix')

Provide `config.h` style constants

     datadir = join_paths (prefix, get_option ('datadir'))
     pkgdatadir = join_paths (datadir, meson.project_name ())
     bindir = join_paths (prefix, get_option ('bindir'))
     pkglibdir = join_paths (prefix, get_option ('libdir'), meson.project_name ())
     localedir = join_paths (prefix, get_option ('localedir'))

     uname_run = run_command ('uname')
     osname = uname_run.stdout().strip()

     conf = configuration_data ()
     conf.set_quoted('PACKAGE', meson.project_name ())
     conf.set_quoted('GETTEXT_PACKAGE', meson.project_name ())
     conf.set_quoted('VERSION', meson.project_version ())
     conf.set_quoted('PACKAGE_LIB_DIR', pkglibdir)
     conf.set_quoted('PACKAGE_DATA_DIR', datadir)
     conf.set_quoted('PACKAGE_LOCALE_DIR', localedir)
     conf.set_quoted('BIN_DIR', bindir)
     conf.set_quoted('OSNAME', osname)

     configure_file (output : 'config.h',
       configuration : conf
     )

Install some extra files

     install_data (
       [
         'myproject.glade'
       ],
       install_dir: pkgdatadir
     )

Define the compile object with dependencies

     executable('myproject', 'main.c',
       dependencies: myproject_deps,
       install: true
     )
