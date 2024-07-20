const audio = await Service.import("audio")

const Volume = (type = 'speaker') => Widget.Slider({
  hexpand: true,
  drawValue: false,
  onChange: ({ value }) => audio[type].volume = value,
  setup: self => self.hook(audio[type], () => {
    self.value = audio[type].volume || 0
  })
})

export const Audio = () => {
  const speakerIcons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  }

  function getSpeakerIcon() {
    const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
      threshold => threshold <= audio.speaker.volume * 100
    )

    return `audio-volume-${speakerIcons[icon!]}-symbolic`
  }

  const speakerIcon = Widget.Icon({
    icon: Utils.watch(getSpeakerIcon(), audio.speaker, getSpeakerIcon),
  })

  const speakerButton = Widget.Button({
    child: speakerIcon,
    on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
  })

  const microphoneIcons = {
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  }

  function getMicrophoneIcon() {
    const icon = audio.microphone.is_muted ? 0 : [67, 34, 1, 0].find(
      threshold => threshold <= audio.microphone.volume * 100
    )

    return `microphone-sensitivity-${microphoneIcons[icon!]}-symbolic`
  }

  const microphoneIcon = Widget.Icon({
    icon: Utils.watch(getMicrophoneIcon(), audio.microphone, getMicrophoneIcon),
  })

  const microphoneButton = Widget.Button({
    child: microphoneIcon,
    on_clicked: () => audio.microphone.is_muted = !audio.microphone.is_muted,
  })

  return Widget.Box({
    class_name: "audio",
    children: [
      speakerButton,
      Volume("speaker"),
      Volume("microphone"),
      microphoneButton,
    ]
  })
}