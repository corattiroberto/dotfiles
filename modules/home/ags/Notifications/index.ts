import { Notification } from "types/service/notifications"

const notifications = await Service.import("notifications")

export const Notifications = (monitor: number = 0) => {

  const NotificationIcon = ({ app_entry, app_icon, image }: Notification) => {
    if (image) {
      return Widget.Box({
        css: `
          background-image: url("${image}");
          background-size: contain;
          background-repeat: no-repeat;
          background-position: center;
        `
      })
    }

    let icon = "dialog-information-symbolic"

    if (Utils.lookUpIcon(app_icon)) {
      icon = app_icon
    }

    if (app_entry && Utils.lookUpIcon(app_entry)) {
      icon = app_entry
    }

    return Widget.Box({
      child: Widget.Icon(icon)
    })
  }

  const Notification = (n: Notification) => {
    const icon = Widget.Box({
      vpack: "start",
      class_name: "icon",
      child: NotificationIcon(n),
    })

    const title = Widget.Label({
      class_name: "title",
      xalign: 0,
      justification: "left",
      hexpand: true,
      max_width_chars: 24,
      truncate: "end",
      wrap: true,
      label: n.summary,
      use_markup: true,
    })

    const body = Widget.Label({
      class_name: "body",
      xalign: 0,
      justification: "left",
      hexpand: true,
      wrap: true,
      label: n.body,
      use_markup: true,
    })

    const actions = Widget.Box({
      class_name: "actions",
      children: n.actions.map(({ id, label }) => Widget.Button({
        class_name: "action-button",
        on_clicked: () => {
          n.invoke(id),
            n.dismiss()
        }
      }))
    })

    return Widget.EventBox(
      {
        attribute: { id: n.id },
        on_primary_click: n.dismiss,
      },
      Widget.Box(
        {
          class_name: `notification ${n.urgency}`,
          vertical: true
        },
        Widget.Box([
          icon,
          Widget.Box(
            { vertical: true },
            title,
            body,
          ),
        ]),
        actions,
      ),
    )
  }

  const list = Widget.Box({
    vertical: true,
    children: notifications.popups.map(Notification),
  })

  const onNotified = (_: unknown, id: number) => {
    const n = notifications.getNotification(id)
    if (n) {
      list.children = [Notification(n), ...list.children]
    }
  }

  const onDismissed = (_: unknown, id: number) => {
    list.children.find(n => n.attribute.id === id)?.destroy()
  }

  list
    .hook(notifications, onNotified, "notified")
    .hook(notifications, onDismissed, "dismissed")

  return Widget.Window({
    monitor,
    name: `notifications${monitor}`,
    class_name: "notification",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: "min-width: 2px; min-height: 2px;",
      vertical: true,
      child: list
    })
  })
} 