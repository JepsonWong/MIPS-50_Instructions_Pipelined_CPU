
`define R    6'b000000

`define add  4'b0000
`define addu 4'b0001
`define sub  4'b0010
`define subu 4'b0011
`define andi 4'b0100
`define ori  4'b0101
`define xori 4'b0110
`define nori 4'b0111
`define lui  4'b1000
`define sll  4'b1001
`define srl  4'b1010
`define sra  4'b1011
`define sllv 4'b1100
`define srlv 4'b1101
`define srav 4'b1110
`define BLEZ_BGTZ_BLTZ_BGEZ 4'b1111

`define S0   4'b0000
`define S1   4'b0001
`define S2   4'b0010
`define S3   4'b0011
`define S4   4'b0100
`define S5   4'b0101
`define S6   4'b0110
`define S7   4'b0111
`define S8   4'b1000
`define S9   4'b1001

`define SLL   6'b000000  //funct
`define SRL   6'b000010  //funct
`define SRA   6'b000011  //funct
`define SLLV  6'b000100  //funct
`define SRLV  6'b000110  //funct
`define SRAV  6'b000111  //funct
`define AND   6'b100100  //funct
`define OR    6'b100101  //funct
`define XOR   6'b100110  //funct
`define NOR   6'b100111  //funct
`define ADDI  6'b001000  //op
`define ADDIU 6'b001001  //op
`define ANDI  6'b001100  //op
`define ORI   6'b001101  //op
`define XORI  6'b001110  //op
`define LUI   6'b001111  //op
`define SLTI  6'b001010  //op
`define SLTIU 6'b001011  //op
`define BEQ   6'b000100  //op
`define BNE   6'b000101  //op
`define BLEZ  6'b000110  //op
`define BGTZ  6'b000111  //op
`define BLTZ_BGEZ  6'b000001  //op
`define BLTZ  5'b00000
`define BGEZ  5'b00001

`define J    6'b000010   //op
`define JAL  6'b000011   //op
`define JALR 6'b001001   //funct
`define JR   6'b001000   //funct

`define LB    6'b100000  //op
`define LBU   6'b100100  //op
`define LH    6'b100001  //op
`define LHU   6'b100101  //op
`define LW    6'b100011  //op
`define SB    6'b101000  //op
`define SH    6'b101001  //op
`define SW    6'b101011  //op

`define ADD   6'b100000  //funct
`define ADDU  6'b100001  //funct
`define SUB   6'b100010  //funct
`define SUBU  6'b100011  //funct






