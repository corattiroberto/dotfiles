const { query } = await Service.import("applications")
const hyprland = await Service.import("hyprland")

export const Workspaces = () => {
  const activeId = hyprland.active.workspace.bind("id")
  const workspaces = hyprland.bind("workspaces").as(ws => ws.map(({ id }) => Widget.Button({
    on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
    child: Widget.Box({ children: hyprland.clients.map(c => Widget.Icon({ icon: query(c.class)[0].icon_name || "" })) }),
    class_name: activeId.as(i => `${i === id ? "focused" : ""}`)
  })))

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces
  })
}