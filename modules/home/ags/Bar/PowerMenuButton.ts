export const PowerMenuButton = () => {
  const powermenuWindowName = "powermenu"
  const powermenuVisible = Variable(false);


  const Icon = Widget.Icon({
    icon: "system-shutdown-symbolic"
  })

  return Widget.Button({
    child: Icon,
    class_name: "powermenu-button",
    on_clicked: () => powermenuVisible.value = !powermenuVisible.value
  })
    .hook(App,
      (_, name: string, visible: boolean) => {
        if (name !== powermenuWindowName) { return }
        powermenuVisible.value = visible
      },
      "window-toggled"
    )
    .hook(powermenuVisible, () => {
      powermenuVisible.value
        ? App.openWindow(powermenuWindowName)
        : App.closeWindow(powermenuWindowName)
    })
}