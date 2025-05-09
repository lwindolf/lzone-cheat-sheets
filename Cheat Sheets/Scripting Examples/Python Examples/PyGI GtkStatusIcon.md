Here is an example on how to build a GtkStatusIcon using PyGI (Python GObject). The code actually implements 
a libpeas plugin that could be used with any GTK+ project that allows for PyGI plugins. The tray icon could respond 
to left clicking by toggling the application window like many instant messengers do. On right clicks it presents 
a menu with the options to toggle the application window or quit the application.

	from gi.repository import GObject, Peas, PeasGtk, Gtk

	class TrayiconPlugin (GObject.Object, PeasActivatable):
	    __gtype_name__ = 'TrayiconPlugin'

	    object = GObject.property (type=GObject.Object)

	    def do_activate (self):
		self.staticon = Gtk.StatusIcon ()
		self.staticon.set_from_stock (Gtk.STOCK_ABOUT)
		self.staticon.connect ("activate", self.trayicon_activate)
		self.staticon.connect ("popup_menu", self.trayicon_popup)
		self.staticon.set_visible (True)

	    def trayicon_activate (self, widget, data = None):
		print "toggle app window!"

	    def trayicon_quit (self, widget, data = None):
		print "quit app!"

	    def trayicon_popup (self, widget, button, time, data = None):
		self.menu = Gtk.Menu ()

		menuitem_toggle = Gtk.MenuItem ("Show / Hide")
		menuitem_quit = Gtk.MenuItem ("Quit")

		menuitem_toggle.connect ("activate", self.trayicon_activate)
		menuitem_quit.connect ("activate", self.trayicon_quit)

		self.menu.append (menuitem_toggle)
		self.menu.append (menuitem_quit)

		self.menu.show_all ()
		self.menu.popup(None, None, lambda w,x: self.staticon.position_menu(self.menu, self.staticon), self.staticon, 3, time)

	    def do_deactivate (self):
		self.staticon.set_visible (False)
		del self.staticon
