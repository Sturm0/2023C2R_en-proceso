; /** defines bool y puntero **/
%define NULL 0
%define TRUE 1
%define FALSE 0

section .data

section .text

global string_proc_list_create_asm
global string_proc_node_create_asm
global string_proc_list_add_node_asm
global string_proc_list_concat_asm

; FUNCIONES auxiliares que pueden llegar a necesitar:
extern malloc
extern free
extern str_concat

string_proc_list_create_asm:
	xor rdi, rdi
	add rdi, 16
	call malloc ; ahora en rax tengo un puntero a la memoria que acabo de reservar
	pxor xmm0, xmm0 ; pongo un 0
	movq [rax],xmm0    ; nuevo->first = NULL
	movq [rax+8],xmm0  ; nuevo->last = NULL
	ret


; los argumentos de string_proc_node:
; DIL <- type
; RSI <- hash
string_proc_node_create_asm:
	xor rdi, rdi
	add rdi,      ; se que ocupa 32 bytes un string_proc_node

string_proc_list_add_node_asm:

string_proc_list_concat_asm:
