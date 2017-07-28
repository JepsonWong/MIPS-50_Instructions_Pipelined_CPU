ori $a0 , $0 , 20
ori $a2 , $0 , 10
ori $a3 , $0 , 30
jal LABEL
jal LABEL
jal LABEL
addu $a1 , $a0 , $0
addu $a1 , $a1 , $a0
addu $a1 , $a1 , $a0
addu $a1 , $a1 , $a0
subu $a1 , $a1 , $a0
subu $a1 , $a1 , $a0
subu $a1 , $a1 , $a0
subu $a1 , $a1 , $a0
lui $t0 , 10
lui $t1 , 20
lui $t2 , 30
ori $t6 , $0 , 20
addu $t3 , $t0 , $t1
addu $t4 , $t0 , $t2
addu $t5 , $t1 , $t2
subu $t3 , $t1 , $t0
subu $t4 , $t2 , $t0
subu $t5 , $t2 , $t1
sw $a0 , 0($0)
sw $a1 , 4($0)
sw $a2 , 8($0)
sw $a3 , 12($0)
sw $t0 , 0($t6)
sw $t1 , 4($t6)
sw $t2 , 8($t6) 
sw $t3 , 12($t6)
lw $s0 , 0($0)
lw $s1 , 4($0)
lw $s2 , 8($0)
lw $s3 , 12($0)
lw $s4 , 0($t6)
lw $s5 , 4($t6)
lw $s6 , 8($t6)
lw $s7 , 12($t6)
beq $0 , $0 , LABEE
addu $t8 , $0 , $t6
addu $t9 , $0 , $t6
LABEL: jr $ra
LABEE:

