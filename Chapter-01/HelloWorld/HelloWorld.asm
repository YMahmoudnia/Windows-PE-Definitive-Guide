;-------------------------
; plaintext1 Example: A simple Win32 console application2
; Author: xia3
; Date: 2010.6.28
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
szText db 'HelloWorld',0
; Code segment
.code
start:
invoke MessageBoxA,NULL,offset szText,NULL,MB_OK
invoke ExitProcess,NULL
end start