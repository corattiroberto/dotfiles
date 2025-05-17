import { Bar } from "./Bar/index.js"
import { ScreenCorners } from "./ScreenCorners/index.js"
import { QuickSettings } from "./QuickSettings/index.js"
import { PowerMenu } from "./PowerMenu/index.js"
import { Notifications } from "./Notifications/index.js";
import { inAllMonitors } from "./utils.js"
import { AppLauncher } from "./AppLauncher/index.js"

App.config({
  style: "./style.css",
  windows: [
    ...inAllMonitors(Bar),
    ...inAllMonitors(ScreenCorners),
    ...inAllMonitors(Notifications),
    QuickSettings(),
    PowerMenu(),
    AppLauncher(),
  ]
})