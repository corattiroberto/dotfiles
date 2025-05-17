import { Audio } from "./Audio.js"
import { Bluetooth } from "./Bluetooth.js"
import { Media } from "./Media.js"

export const QuickSettings = () => {
  const WINDOW_NAME = "quicksettings"

  return Widget.Window({
    visible: false,
    name: WINDOW_NAME,
    class_name: "quicksettings-window",
    anchor: ["top", "right"],
    keymode: "exclusive",
    setup: self => self.keybind("Escape", () => {
      App.closeWindow(WINDOW_NAME)
    }),
    child: Widget.Box({
      class_name: "quicksettings",
      vertical: true,
      margin_top: 12,
      margin_right: 12,
      margin_bottom: 12,
      margin_left: 12,
      children: [
        Bluetooth(),
        Audio(),
        Media()
      ]
    })
  })
}