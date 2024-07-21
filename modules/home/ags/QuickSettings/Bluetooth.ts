const bluetooth = await Service.import("bluetooth")

const BLUETOOTH_ICON = "bluetooth-symbolic"

export const Bluetooth = () => {

  const BluetoothButton = Widget.Button()

  const BluetoothIcon = Widget.Icon({
    icon: BLUETOOTH_ICON
  })

  return Widget.Box({
    class_name: "bluetooth",
    children: [
      BluetoothButton,
      Widget.ToggleButton({
        on_toggled: ({ active }) => print(active),
        child: BluetoothIcon
      })
    ]
  })
}