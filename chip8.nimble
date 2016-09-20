# Package
version       = "0.1.0"
author        = "Josh Girvin"
description   = "A Chip-8 emulator"
license       = "MIT"

# Dependencies
requires "nim >= 0.14.2"

# Build config
srcDir = "src"
binDir = "build"
bin = @["chip8"]

# Utility procs
proc getParamsStr(): string =
  var args = ""
  if paramCount() == 1:
    return args
  for i in 2..paramCount():
    args &= " " & paramStr(i)
  return args

# Tasks
task debug, "Build a debug version of chip8":
  exec("nim c --debugger:native -o:./build/chip8 src/chip8")

task run, "Run the interpreter":
  exec(binDir & '/' & bin[0] & getParamsStr())
