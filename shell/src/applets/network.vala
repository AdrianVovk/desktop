class NetworkApplet : Applet {
	protected override Gtk.Widget create_panel_widget() {
		Gtk.ToggleToolButton button = new Gtk.ToggleToolButton();
		Gtk.Image icon = new Gtk.Image.from_icon_name("preferences-system-network-symbolic", Gtk.IconSize.INVALID);
		icon.set_pixel_size(16);
		button.set_icon_widget(icon);
		button.set_tooltip_text("Networking");
		return button;
	}
	
	protected override Gtk.Popover? create_popup(Gtk.Widget attach_to) {
		Gtk.Popover panel = new Gtk.Popover(attach_to);
		panel.set_size_request(300, 500);
		return panel;
	}
}