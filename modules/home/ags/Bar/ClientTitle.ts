const hyprland = await Service.import("hyprland")

export const ClientTitle = () => {
  return Widget.Label({
    class_name: "client-title",
    max_width_chars: 40,
    truncate: "end",
    label: hyprland.active.client.bind("title")
  })
}