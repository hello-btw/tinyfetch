import std/[os, nativesockets, strutils, terminal, strformat, unicode]
proc getMemoryInfo(): string =
  var totalMem = 0.0
  var availableMem = 0.0
  for line in lines("/proc/meminfo"):
    let parts = strutils.splitWhitespace(line)
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
let osPadded     = getOSName().runeAlignLeft(25).runeSubstr(0, 24)
let memPadded    = getMemoryInfo().runeAlignLeft(25).runeSubstr(0, 24)
let kernelPadded = kernelVersion.runeAlignLeft(25).runeSubstr(0, 24)
echo ""
styledEcho(fgRed, "              <", fgBlue, user, fgRed, ">-", fgYellow, "M", fgRed, "-<", fgBlue, host, fgRed, ">")
styledEcho(fgMagenta, " .----------------------------------------------.")
styledEcho(fgMagenta, " | ", fgBlack, "(", fgDefault, "o", fgYellow, "_  ", fgBlack, "(", fgDefault, "o", fgYellow, "_  ", fgMagenta, "| ", fgBlue, "OS:     ", fgCyan, osPadded, fgMagenta, "|")
styledEcho(fgMagenta, " | ", fgBlack, "/", fgBlack, "/", fgBlack, "\\  ", fgBlack, "/", fgBlack, "/", fgBlack, "\\  ", fgMagenta, "| ", fgBlue, "Kernel: ", fgCyan, kernelPadded, fgMagenta, "|")
styledEcho(fgMagenta, " | ", fgBlack, "V_/_ ", fgBlack, "V_/_ ", fgMagenta, "| ", fgBlue, "Memory: ", fgCyan, memPadded, fgMagenta, "|")
styledEcho(fgMagenta, " '----------------------------------------------'")
styledEcho(fgRed, "    <---->", fgGreen, "<---->", fgYellow, "<---->", fgBlue, "<---->", fgMagenta, "<---->", fgCyan, "<---->", fgBlack, "<---->" )
echo ""
