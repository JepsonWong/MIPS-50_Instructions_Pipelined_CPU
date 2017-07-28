addi $1,$0,32516
addi $2,$0,8
sw $2,0($1)
addi $3,$0,3
addi $4,$0,4
addi $5,$0,5
addi $6,$0,6
addi $7,$0,7
addi $8,$0,8
.ktext 0x00004108
addi $sp,$sp,-4
sw $2,0($sp)
sw $2,0($1)
lw $2,1($sp)
addi $sp,$sp,4
eret