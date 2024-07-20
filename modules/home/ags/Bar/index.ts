const notifications = await Service.import("notifications")
const systemtray = await Service.import("systemtray")

import { Workspaces } from "./Workspaces.js"
import { ClientTitle } from "./ClientTitle.js"
import { Clock } from "./Clock.js"
import { QuickSettingsToggle } from "./QuickSettingsToggle.js"
import { PowerMenuButton } from "./PowerMenuButton.js"


function Notification() {
  const popups = notifications.bind("popups")
  return Widget.Box({
    class_name: "notification",
    visible: popups.as(p => p.length > 0),
    children: [
      Widget.Icon({
        icon: "preferences-system-notifications-symbolic"
      }),
      Widget.Label({
        label: popups.as(p => p[0]?.summary || "")
      })
    ]
  })
}

function SysTray() {
  const items = systemtray.bind("items")
    .as(items => items.map(item => Widget.Button({
      child: Widget.Icon({ icon: item.bind("icon") }),
      on_primary_click: (_, event) => item.activate(event),
      on_secondary_click: (_, event) => item.openMenu(event),
      tooltip_markup: item.bind("tooltip_markup"),
    })))

  return Widget.Box({
    children: items
  })
}

function Left() {
  return Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
      ClientTitle(),
    ]
  })
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [
      Clock(),
    ]
  })
}

function Right() {
  return Widget.Box({
    spacing: 8,
    hpack: "end",
    children: [
      Notification(),
      SysTray(),
      QuickSettingsToggle(),
      PowerMenuButton(),
    ]
  })
}

export const Bar = (monitor = 0) => Widget.Window({
  monitor,
  name: `bar${monitor}`,
  class_name: "bar",
  anchor: ["top", "left", "right"],
  exclusivity: "exclusive",
  child: Widget.CenterBox({
    class_name: "container",
    margin_bottom: 2,
    spacing: 16,
    start_widget: Left(),
    center_widget: Center(),
    end_widget: Right(),
  })
})
