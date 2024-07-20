export const PowerMenu = () => {
  const WINDOW_NAME = "powermenu"

  const ICON_LOGOUT = "system-log-out-symbolic"
  const ICON_REBOOT = "system-reboot-symbolic";
  const ICON_SHUTDOWN = "system-shutdown-symbolic";

  return Widget.Window({
    visible: false,
    name: WINDOW_NAME,
    class_name: "powermenu-window",
    keymode: "exclusive",
    setup: self => self.keybind("Escape", () => {
      App.closeWindow(WINDOW_NAME)
    }),
    child: Widget.Box({
      class_name: "powermenu",
      vertical: false,
      spacing: 16,
      margin_top: 8,
      margin_right: 8,
      margin_bottom: 8,
      margin_left: 8,
      children: [
        Widget.Button({
          on_clicked: () => Utils.exec("hyprctl dispatch exit")
        },
          Widget.Box({ vertical: true, spacing: 4 },
            Widget.Icon({ icon: ICON_LOGOUT, size: 48 }),
            Widget.Label({ label: "Logout" })
          ),
        ),

        Widget.Button({
          on_clicked: () => Utils.exec("reboot")
        },
          Widget.Box({ vertical: true, spacing: 4 },
            Widget.Icon({ icon: ICON_REBOOT, size: 48 }),
            Widget.Label({ label: "Reboot" })
          ),
        ),

        Widget.Button({
          on_clicked: () => Utils.exec("poweroff")
        },
          Widget.Box({ vertical: true, spacing: 4 },
            Widget.Icon({ icon: ICON_SHUTDOWN, size: 48 }),
            Widget.Label({ label: "Shutdown" })
          ),
        ),
      ]
    })
  })
}