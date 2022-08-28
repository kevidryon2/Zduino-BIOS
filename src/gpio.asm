
;B holds the GPIO pin and A's first bit holds the value.
SetGPIOPin:
  inc b
  push af
  ld b, a
  and $08 ;Obtain if A is multiple of 8
  ld a, b
  jr nz, .secondPort
.firstPort:
  pop af
.decLoop1:
  sla a
  djnz .decLoop1
  sra a
  push bc
  ;TODO: fix pin 7 bug
  ld c, a
  ld a, ($ff00)
  or c
  ld ($ff00), a
  pop bc
.secondPort:
  pop af
.decLoop2:
  sla a
  djnz .decLoop2
  sra a
  push bc
  ;TODO: fix pin 7 bug
  ld c, a
  ld a, ($ff00)
  or c
  ld ($ff00), a
  pop bc
