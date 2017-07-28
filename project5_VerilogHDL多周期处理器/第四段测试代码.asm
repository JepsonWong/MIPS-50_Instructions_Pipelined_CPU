addu $5, $0 ,12345678
addi $20 , $0 ,-1
lui $6,1000
slti $15 , $5,223
slti $17 , $0 ,12
sltiu $18 , $0 ,13
sltiu $16 , $5 ,12
bltz $20 , N
M:and $4 , $0 ,2234
andi $7 , $5,6575
or $8 , $5, $4
ori $9 , $5,32
xor $10 , $5 , $4
xori $11 , $5 , 56
nor $12, $5 , $4
addi $13 , $0 ,-100
addiu $14 , $0 ,98
beq $0 , $0 , L
N:bltz $20 ,M
L:
