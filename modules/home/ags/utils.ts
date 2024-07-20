import Gtk from "gi://Gtk?version=3.0"
import Gdk from "gi://Gdk"

export function range(length: number, start: number = 1): number[] {
  return Array.from({ length }, (_, i) => i + start)
}

export function inAllMonitors(widget: (monitor: number) => Gtk.Window): Gtk.Window[] {
  const default_display = Gdk.Display.get_default()
  if (default_display) {
    const n = default_display.get_n_monitors() || 1
    return range(n, 0).flatMap(widget)
  } else {
    return [widget(0)]
  }
}