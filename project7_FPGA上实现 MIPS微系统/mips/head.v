
`define R    6'b000000
`define COP0 6'b010000

`define add  5'b00000
`define addu 5'b00001
`define sub  5'b00010
`define subu 5'b00011
`define andi 5'b00100
`define ori  5'b00101
`define xori 5'b00110
`define nori 5'b00111
`define lui  5'b01000
`define sll  5'b01001
`define srl  5'b01010
`define sra  5'b01011
`define sllv 5'b01100
`define srlv 5'b01101
`define srav 5'b01110
`define BLEZ_BGTZ_BLTZ_BGEZ 5'b01111
`define sltu 5'b10000
`define mult 5'b10001
`define multu 5'b10010
`define div  5'b10011
`define divu  5'b10100

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
`define S10  4'b1010
`define S11  4'b1011

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
`define SLT   6'b101010  //funct
`define SLTU  6'b101011  //funct
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

`define MFHI  6'b010000  //funct
`define MFLO  6'b010010  //funct
`define MTHI  6'b010001  //funct
`define MTLO  6'b010011  //funct

`define ERET  6'b011000  //cp0
`define MFC0  5'b00000   //cp0
`define MTC0  5'b00100   //cp0

`define DIV   6'b011010  //funct
`define DIVU  6'b011011  //funct
`define MULT  6'b011000  //funct
`define MULTU 6'b011001  //funct
`define MFHI  6'b010000  //funct
`define MFLO  6'b010010  //funct
`define MTHI  6'b010001  //funct
`define MTLO  6'b010011  //funct
 
 
`define _0  8'b00000011
`define _1  8'b10011111
`define _2  8'b00100101
`define _3  8'b00001101
`define _4  8'b10011001
`define _5  8'b01001001
`define _6  8'b01000001
`define _7  8'b00011111
`define _8  8'b00000001
`define _9  8'b00001001
`define A  8'b00010001
`define B  8'b11000001
`define C  8'b01100011
`define D  8'b10000101
`define E  8'b01100001
`define F  8'b01110001





