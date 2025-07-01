.section	.data
s:
	.asciz	"hello world\n"

.section	.text

.globl	_start
_start:
	movq	$1	,	%rax
	movq	$1	,	%rdi
	leaq	s(%rip)	,	%rsi
	movq	$13	,	%rdx
	syscall
	movq	$60	,	%rax
	movq	$0	,	%rdi
	syscall

.globl	charr2int
charr2int:
	pushq	%rbx
	pushq	$0
	pushq	%rdi
	movq	$0	,	%rax
	cmpb	$'-'	,	(%rdi)
	je	less_than0
	cmpb	$'+'	,	(%rdi)
	je	great_than0
	jmp	loop_c2i
less_than0:
	movq	$1	,	8(%rsp)
great_than0:
	addq	$1	,	%rdi
loop_c2i:
	movb	(%rdi)	,	%bl
	cmpb	$'0'	,	%bl
	jl	end1_c2i
	cmpb	$'9'	,	%bl
	jg	end1_c2i
	addq	$1	,	%rdi
	imulq	$10	,	%rax
	movsbq	%bl	,	%rbx
	subq	$'0'	,	%rbx
	addq	%rbx	,	%rax
	jmp	loop_c2i
end1_c2i:
	cmpq	$1	,	8(%rsp)
	jne	end2_c2i
	notq	%rax
	addq	$1	,	%rax
end2_c2i:
	popq	%rdi
	addq	$8	,	%rsp
	popq	%rbx
	ret

.globl	charr_cat
charr_cat:
	pushq	%rsi
	pushq	%rdi
	call	charr_len
	addq	%rax	,	%rdi
	call	charr_cpy
	popq	%rdi
	popq	%rsi
	ret

.globl	charr_cmp
charr_cmp:
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
loop_cmp:
	movb	(%rdi)	,	%al
	movb	(%rsi)	,	%bl
	cmpb	%bl	,	%al
	jne	end_cmp
	cmpb	$'\0'	,	%al
	je	end_cmp
	cmpb	$'\0'	,	%bl
	je	end_cmp
	addq	$1	,	%rsi
	addq	$1	,	%rdi
	jmp	loop_cmp
end_cmp:
	movsbq	%al	,	%rax
	movsbq	%bl	,	%rbx
	subq	%rbx	,	%rax
	popq	%rbx
	popq	%rdi
	popq	%rsi
	ret

.globl	charr_charr
#	void charr_charr(char *s,char *p){
#		ll slen,plen,*pi;
#		plen=strlen(p);
#		if(plen==0){
#			return s;
#		}	slen=strlen(s);
#		if(slen==0){
#			return NULL;
#		}	pi=(ll*)malloc(plen*sizeof(ll));
#		for(int i=1,j=0;i<plen;i++){
#			while(j&&p[j]!=p[i]){
#				j=pi[j-1];
#			}	if(p[j]==p[i]){
#				j++;
#			}	pi[i]=j;
#		}	for(int i=0,j=0;i<slen;i++){
#			if(s[i]==p[j]){
#				j++;
#			}else{
#				while(j&&s[i]!=p[j]){
#					j=pi[j-1];
#				}	if(s[i]==p[j]){
#					j++;
#				}
#			}	if(j==plen){
#				free(pi);
#				return a+i-j+2;
#				j=pi[j-1];
#			}
#		}
#		return NULL;
#	}
	ret

.globl	charr_ch
charr_ch:
	pushq	%rdi
	pushq	%rsi
loop_ch:
	movb	(%rdi)	,	%al
	cmpb	%sil	,	%al
	je	end_ch
	cmpb	$'\0'	,	%al
	je	ans_ch
	addq	$1	,	%rdi
	jmp	loop_ch
ans_ch:
	movq	$0	,	%rdi
end_ch:
	movq	%rdi	,	%rax
	popq	%rsi
	popq	%rdi
	ret

.globl	charr_cpy
charr_cpy:
	pushq	%rsi
	pushq	%rdi
loop_cpy:
	cmpb	$'\0'	,	(%rsi)
	je	end_cpy
	movb	(%rsi)	,	%al
	movb	%al	,	(%rdi)
	addq	$1	,	%rsi
	addq	$1	,	%rdi
	jmp	loop_cpy
end_cpy:
	movb	$'\0'	,	(%rdi)
	popq	%rdi
	popq	%rsi
	ret

.globl	charr_len
charr_len:
	pushq	%rdi
	pushq	%rbx
	movq	$0	,	%rax
loop_len:
	movb	(%rdi)	,	%bl
	cmpb	$'\0'	,	%bl
	je	end_len
	addq	$1	,	%rdi
	addq	$1	,	%rax
	jmp	loop_len
end_len:
	popq	%rbx
	popq	%rdi
	ret

.globl	charr_rch
charr_rch:
	pushq	%rdi
	pushq	%rsi
	pushq	%r15
	movq	%rdi	,	%r15
	call	charr_len
	addq	%rax	,	%rdi
loop_rch:
	movb	(%rdi)	,	%al
	cmpb	%sil	,	%al
	je	end_rch
	cmpq	%r15	,	%rdi
	je	ans_rch
	subq	$1	,	%rdi
	jmp	loop_rch
ans_rch:
	movq	$0	,	%rdi
end_rch:
	movq	%rdi	,	%rax
	popq	%r15
	popq	%rsi
	popq	%rdi
	ret
