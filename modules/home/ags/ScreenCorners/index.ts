export const ScreenCorners = (monitor: number) => {
  const WINDOW_NAME = `screencorners${monitor}`

  return Widget.Window({
    monitor,
    name: WINDOW_NAME,
    anchor: ["top", "right", "bottom", "left"],
    click_through: true,
    class_name: "screencorners-window",
    child: Widget.Box({
      class_name: "screencorners",
      expand: true,
      child: Widget.Box({
        class_name: "corner",
        expand: true,
      })
    })
  })
}