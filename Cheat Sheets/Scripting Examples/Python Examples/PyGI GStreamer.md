When trying to implement a media player plugin for <a href="https://lzone.de/liferea">Liferea</a> I learned at lot from Laszlo Pandy's 
<a href="http://laszlopandy.com/2010/03/03/opportunistic-developer-week/">session slides</a> from the Ubuntu 
Opportunistic Developer Week (<a href="http://laszlopandy.com/blog_files/opportunistic-developer-gstreamer.pdf">PDF</a>, 
<a href="http://laszlopandy.com/files/playback_interface_complete.html">source</a>). The only problem was that it was
written for PyGtk, the GTK binding for Python, which is now more or less deprecated in favour of PyGI, the 
GTK+ 3.0 GObject introspection based binding.

While it is easy to convert all pieces manually following the <a href="https://wiki.ubuntu.com/Novacut/GStreamer1.0">Novacut/GStreamer1.0 documentation</a> 
I still want to share a complete music player source example that everyone interested can copy from. I hope this saves 
the one or the other some time in guessing how to write something like `gst.FORMAT_TIME` in PyGI (actually it is `Gst.Format.TIME`).

Here is the example code:

	from gi.repository import GObject
	from gi.repository import GLib
	from gi.repository import Gtk
	from gi.repository import Gst

	class PlaybackInterface:

	    def __init__(self):
		self.playing = False

		# A free example sound track
		self.uri = "http://cdn02.cdn.gorillavsbear.net/wp-content/uploads/2012/10/GORILLA-VS-BEAR-OCTOBER-2012.mp3"

		# GTK window and widgets
		self.window = Gtk.Window()
		self.window.set_size_request(300,50)

		vbox = Gtk.Box(Gtk.Orientation.HORIZONTAL, 0)
		vbox.set_margin_top(3)
		vbox.set_margin_bottom(3)
		self.window.add(vbox)

		self.playButtonImage = Gtk.Image()
		self.playButtonImage.set_from_stock("gtk-media-play", Gtk.IconSize.BUTTON)
		self.playButton = Gtk.Button.new()
		self.playButton.add(self.playButtonImage)
		self.playButton.connect("clicked", self.playToggled)
		Gtk.Box.pack_start(vbox, self.playButton, False, False, 0)

		self.slider = Gtk.HScale()
		self.slider.set_margin_left(6)
		self.slider.set_margin_right(6)
		self.slider.set_draw_value(False)
		self.slider.set_range(0, 100)
		self.slider.set_increments(1, 10)

		Gtk.Box.pack_start(vbox, self.slider, True, True, 0)

		self.label = Gtk.Label(label='0:00')
		self.label.set_margin_left(6)
		self.label.set_margin_right(6)
		Gtk.Box.pack_start(vbox, self.label, False, False, 0)

		self.window.show_all()

		# GStreamer Setup
		Gst.init_check(None)
		self.IS_GST010 = Gst.version()[0] == 0
		self.player = Gst.ElementFactory.make("playbin2", "player")
		fakesink = Gst.ElementFactory.make("fakesink", "fakesink")
		self.player.set_property("video-sink", fakesink)
		bus = self.player.get_bus()
		#bus.add_signal_watch_full()
		bus.connect("message", self.on_message)
		self.player.connect("about-to-finish",  self.on_finished)

	    def on_message(self, bus, message):
		t = message.type
		if t == Gst.Message.EOS:
			self.player.set_state(Gst.State.NULL)
			self.playing = False
		elif t == Gst.Message.ERROR:
			self.player.set_state(Gst.State.NULL)
			err, debug = message.parse_error()
			print "Error: %s" % err, debug
			self.playing = False

		self.updateButtons()

	    def on_finished(self, player):
		self.playing = False
		self.slider.set_value(0)
		self.label.set_text("0:00")
		self.updateButtons()

	    def play(self):
		self.player.set_property("uri", self.uri)
		self.player.set_state(Gst.State.PLAYING)
		GObject.timeout_add(1000, self.updateSlider)

	    def stop(self):
		self.player.set_state(Gst.State.NULL)

	    def playToggled(self, w):
		self.slider.set_value(0)
		self.label.set_text("0:00")

		if(self.playing == False):
			self.play()
		else:
			self.stop()

		self.playing=not(self.playing)
		self.updateButtons()

	    def updateSlider(self):
		if(self.playing == False):
		   return False # cancel timeout

		try:
		   if self.IS_GST010:
		      nanosecs = self.player.query_position(Gst.Format.TIME)[2]
		      duration_nanosecs = self.player.query_duration(Gst.Format.TIME)[2]
		   else:
		      nanosecs = self.player.query_position(Gst.Format.TIME)[1]
		      duration_nanosecs = self.player.query_duration(Gst.Format.TIME)[1]

		   # block seek handler so we don't seek when we set_value()
		   # self.slider.handler_block_by_func(self.on_slider_change)

		   duration = float(duration_nanosecs) / Gst.SECOND
		   position = float(nanosecs) / Gst.SECOND
		   self.slider.set_range(0, duration)
		   self.slider.set_value(position)
		   self.label.set_text ("%d" % (position / 60) + ":%02d" % (position % 60))

		   #self.slider.handler_unblock_by_func(self.on_slider_change)

		except Exception as e:
			# pipeline must not be ready and does not know position
			print e
			pass

		return True

	    def updateButtons(self):
		if(self.playing == False):
		   self.playButtonImage.set_from_stock("gtk-media-play", Gtk.IconSize.BUTTON)
		else:
		   self.playButtonImage.set_from_stock("gtk-media-stop", Gtk.IconSize.BUTTON)

	if __name__ == "__main__":
	    PlaybackInterface()
	    Gtk.main()

and this is how it should look like if everything goes well:

<p>
<img src="/images/python-gst-player-example.png" alt="Example Player Screenshot"/>
</p>
