export const QuickSettingsToggle = () => {
  const quicksettingsWindowName = "quicksettings"
  const quicksettingsVisible = Variable(false);


  const Icon = Widget.Icon({
    icon: "emblem-system-symbolic"
  })

  return Widget.Button({
    child: Icon,
    on_clicked: () => quicksettingsVisible.value = !quicksettingsVisible.value
  })
    .hook(App,
      (_, name: string, visible: boolean) => {
        if (name !== quicksettingsWindowName) { return }
        quicksettingsVisible.value = visible
      },
      "window-toggled"
    )
    .hook(quicksettingsVisible, () => {
      quicksettingsVisible.value
        ? App.openWindow(quicksettingsWindowName)
        : App.closeWindow(quicksettingsWindowName)
    })
}