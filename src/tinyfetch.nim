import std/[os, nativesockets, strutils, terminal, strformat]
proc getMemoryInfo(): string =
  var totalMem = 0.0
  var availableMem = 0.0
  for line in lines("/proc/meminfo"):
    let parts = line.splitWhitespace()
    if parts.len >= 2:
      if parts[0] == "MemTotal:":
        totalMem = parts[1].parseFloat() / 1024.0 / 1024.0
      elif parts[0] == "MemAvailable:":
        availableMem = parts[1].parseFloat() / 1024.0 / 1024.0
  let usedMem = totalMem - availableMem
  return fmt"{usedMem:.1f}G/{totalMem:.1f}G"
proc getOSName(): string =
  result = hostOS 
  if fileExists("/etc/os-release"):
    for line in lines("/etc/os-release"):
      if line.startsWith("PRETTY_NAME="):
        result = line.split("=")[1].strip(chars = {'"'})
        break
let user = getEnv("USER")
let host = getHostname()
let kernelData = readFile("/proc/version").splitWhitespace()
let kernelVersion = if kernelData.len > 2: kernelData[2] else: "Unknown"
let osPadded     = getOSName().alignLeft(25)[0..24]
let memPadded    = getMemoryInfo().alignLeft(25)[0..24]
let kernelPadded = kernelVersion.alignLeft(25)[0..24]
echo ""
styledEcho(fgRed, "                <", fgBlue, user, fgRed, ">-", fgYellow, "M", fgRed, "-<", fgBlue, host, fgRed, ">")
styledEcho(fgMagenta, " .---------------------------------------------------.")
styledEcho(fgMagenta, " | ", fgWhite, "(", fgDefault, "o", fgYellow, "_  ", fgWhite, "(", fgDefault, "o", fgYellow, "_  ", fgMagenta, "|", fgBlue, " 󰻀 ", fgMagenta, " | ", fgBlue, "OS:     ", fgCyan, osPadded, fgMagenta, "|")
styledEcho(fgMagenta, " | ", fgWhite, "/", fgWhite, "/", fgDefault, "\\  ", fgWhite, "/", fgWhite, "/", fgDefault, "\\  ", fgMagenta, "|", fgBlue, " 󰌢 ", fgMagenta, " | ", fgBlue, "Kernel: ", fgCyan, kernelPadded, fgMagenta, "|")
styledEcho(fgMagenta, " | ", fgWhite, "V", fgYellow, "_", fgDefault, "/", fgYellow, "_ ", fgWhite, "V", fgYellow, "_", fgDefault, "/", fgYellow, "_ ", fgMagenta, "|", fgBlue, " 󰍛 ", fgMagenta, " | ", fgBlue, "Memory: ", fgCyan, memPadded, fgMagenta, "|")
styledEcho(fgMagenta, " '---------------------------------------------------'")
styledEcho(fgRed, "      <---->", fgGreen, "<---->", fgYellow, "<---->", fgBlue, "<---->", fgMagenta, "<---->", fgCyan, "<---->", fgWhite, "<---->" )
echo ""
