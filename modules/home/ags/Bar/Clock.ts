const date = Variable("", {
  poll: [1000, "/run/current-system/sw/bin/date '+%a %e %b %X'"]
})

export const Clock = () =>
  Widget.Label({
    justification: "center",
    class_name: "clock",
    label: date.bind()
  })
