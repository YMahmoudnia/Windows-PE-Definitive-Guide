;-------------------------
; Example: A simple Crack ME
; Author: Yashar Mahmoudnia
; Date: 2024.06.13
;-------------------------

.386
.model flat,stdcall
option casemap:none

include windows.inc
include user32.inc
includelib user32.lib
include kernel32.inc
includelib kernel32.lib

; Data segment
.data
szFound    db 'license found!',0
szNotFound db 'license not found!',0
szPath     db "license.bin", 0
szTitle    db "DWORD.IR",0
; Code segment
.code
start:
	;push szPath to stack
	push offset szPath
	call GetFileAttributesA
	;compare eax with 0xFFFFFFFF
    cmp eax, INVALID_FILE_ATTRIBUTES
    je FileNotFound
  
FileFound:
    invoke MessageBoxA, NULL, offset szFound, offset szTitle, MB_OK
	invoke ExitProcess, NULL
	
FileNotFound:
    invoke MessageBoxA, NULL, offset szNotFound, offset szTitle, MB_OK
    invoke ExitProcess, NULL
end start