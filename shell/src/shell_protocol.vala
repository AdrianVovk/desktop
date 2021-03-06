private PanelWindow panel_window = null;
void set_panel(PanelWindow window) {
	if (is_wayfire_ready())
		wayfire_set_panel(window.get_window());
	else
		panel_window = window;
}

private BackgroundWindow wall_window = null;
void set_wallpaper(BackgroundWindow window) {
	if (is_wayfire_ready())
		wayfire_set_background(window.get_window());
	else
		wall_window = window;
}

// Called when the connection to Wayfire is successful
void on_wayfire_ready() {
	if (panel_window != null) set_panel(panel_window);
	if (wall_window != null) set_wallpaper(wall_window);
}

void steal_focus () {
	if (is_wayfire_ready ()) wayfire_focus_panel ();
}

void return_focus () {
	if (is_wayfire_ready ()) wayfire_unfocus_panel ();
}

bool connecting_to_wayfire = false;
void connect_to_wayfire (Gdk.Display disp) {
	if (!connecting_to_wayfire) {
		setup_wayfire_connection (disp);
		connecting_to_wayfire = true;
	} else print ("Already connecting to Wayfire\n");
}

extern void setup_wayfire_connection(Gdk.Display disp);
extern void wayfire_set_panel(Gdk.Window window);
extern void wayfire_set_background(Gdk.Window window);
extern void wayfire_focus_panel();
extern void wayfire_unfocus_panel();
extern bool is_wayfire_ready();