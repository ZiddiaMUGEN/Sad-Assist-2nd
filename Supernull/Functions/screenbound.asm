;;;; lualoader.asm: patch to the ScreenBound parameter resets. allows ScreenBound to be applied for `n` ticks through Lua.
;; EBP=character base
[bits 32]

push eax

; check tick timer stored at playerdata+0x5C
; (note playerdata+0x5C is Const(data.attack.z.width.front) which is unused).
mov eax,dword [ebp + 0x5C]
; decrease
dec eax
; if < 0, reset screenbound
cmp eax,0x00
jl .reset
; else, decrement timer and ignore
mov dword [ebp + 0x2AC], eax
jmp .done

.reset:
mov dword [ebp + 0x2AC], 0x00
mov dword [ebp + 0x28C], 0x01
mov dword [ebp + 0x290], 0x01
mov dword [ebp + 0x294], 0x01

.done:
pop eax
ret