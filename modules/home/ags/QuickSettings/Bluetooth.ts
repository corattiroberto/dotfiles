import { execAsync } from "resource:///com/github/Aylur/ags/utils/exec.js"


const bluetooth = await Service.import("bluetooth")

const ENABLED_ICON = "bluetooth-active-symbolic"
const DISABLED_ICON = "bluetooth-disabled-symbolic"

export const Bluetooth = () => {

  const BluetoothButton = Widget.Button({
    class_name: "settings-button",
    child: Widget.Icon({ icon: "emblem-system-symbolic" }),
    on_clicked: () => execAsync("blueman-manager"),
    setup: self => self.hook(bluetooth, () => {
      self.toggleClassName("active", bluetooth.enabled)
    }),
  })

  const BluetoothIcon = Widget.Icon({
    icon: bluetooth.bind("enabled").as(p => p ? ENABLED_ICON : DISABLED_ICON)
  })

  const BluetoothLabel = Widget.Label({
    max_width_chars: 10,
    truncate: "end",
    label: Utils.watch("Disabled", bluetooth, () => {
      if (!bluetooth.enabled) {
        return "Disabled"
      }

      if (bluetooth.connected_devices.length === 1) {
        return bluetooth.connected_devices[0].alias
      }

      if (bluetooth.connected_devices.length > 1) {
        return `${bluetooth.connected_devices.length} connected`
      }

      return "Enabled"
    }),
  })

  const BluetoothToggleButton =
    Widget.ToggleButton({
      class_name: "toggle-button",
      on_toggled: () => bluetooth.enabled = !bluetooth.enabled,
      setup: self => self.hook(bluetooth, () => {
        self.toggleClassName("active", bluetooth.enabled)
      }),
      child: Widget.Box({
        spacing: 4,
        children: [
          BluetoothIcon,
          BluetoothLabel,
        ],
      }),
    })

  return Widget.Box({
    class_name: "bluetooth",
    spacing: 8,
    children: [
      BluetoothToggleButton,
      BluetoothButton,
    ]
  })
}