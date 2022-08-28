;Zduino-BIOS, the BIOS for the Zduino (A small board that uses a Z80).
;Copyright (C) 2022 kevidryon2
;
;This program is free software: you can redistribute it and/or modify
;it under the terms of the GNU Affero General Public License as published
;by the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.
;
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU Affero General Public License for more details.
;
;You should have received a copy of the GNU Affero General Public License
;along with this program.  If not, see <https://www.gnu.org/licenses/>.

;0000-00FF: Bootloader
;0100-1FFF: Built-in functions

;2000-3FFF: EPROM A
;4000-7FFF: EPROM B

;8000-9FFF: WRAM
;A000-FEFF: Mirrors of WRAM
;FF00-FFFF: I/O

;FF00: GPIO pins 0-7
;FF01: GPIO pins 8-15
;FF02: Serial channel 1
;FF03: Serial channel 2

;B0-B1 BIOS
;B1-B4 EPROM
;B4-B5 WRAM
;B5-B8 Mirrors and I/O

Reset:
  ld sp, $9FFF ;Initialize stack at end of WRAM

CallSetupFn:
  ;Read pointer to Setup()
  ld a, ($2000)
  ld l, a
  ld a, ($2001)
  ld h, a

  ld de, CallLoopFn

  push de
  jp (hl)

CallLoopFn:
  ;Read pointer to Loop()
  ld a, ($2002)
  ld l, a
  ld a, ($2003)
  ld h, a

  ld de, .loop
.loop:
  push de
  jp (hl)

;TODO: Implement the C Standard library (or at least parts of it)

;TODO: Implement a Basic File System

;TODO: Implement a library for I/O like buzzers, LCD screens, and all sorts of other stuff (but this will be in Flash)
