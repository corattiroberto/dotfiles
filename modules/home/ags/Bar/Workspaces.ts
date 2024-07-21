const { query } = await Service.import("applications")
const hyprland = await Service.import("hyprland")

export const Workspaces = () => {
  const activeId = hyprland.active.workspace.bind("id")
  const workspaces = hyprland.bind("workspaces").as(ws => ws.map(({ id }) => Widget.Button({
    on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
    child: Widget.Box({
      spacing: 4,
      children: [
        Widget.Label({ label: `${id}:` }),
        ...hyprland.clients.filter(c => c.workspace.id === id).map(c => {
          const appsQueried = query(c.class);
          const iconName = appsQueried.length > 0 ? appsQueried[0].icon_name : null

          if (iconName !== null) {
            return Widget.Icon({ icon: iconName })
          } else {
            return Widget.Label({ label: String(id) })
          }
        }),
      ]
    }),
    class_name: activeId.as(i => `${i === id ? "focused" : ""}`)
  })))

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces
  })
}