import { Audio } from "./Audio.js"
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
      margin_top: 8,
      margin_right: 8,
      margin_bottom: 8,
      margin_left: 8,
      children: [
        Audio(),
        Media()
      ]
    })
  })
}