.include "../includeConstantesARM64.inc"

// panjang dari hasil
.equ LGHASH, 32


// contoh dari variabel struktur

.struct 0

var_a:
    .struct var_a + 4
var_b:
    .struct var_b + 4
var_c:
    .struct var_c + 4
var_d:
    .struct var_c + 4
var_e:
    .struct var_c + 4
var_f:
    .struct var_c + 4
var_g:
    .struct var_c + 4
var_h:
    .struct var_c + 4


.data
szMessRosseta:  .asciz "bellshade"
szMessTest1:    .asciz  "abc"
szMessSup64:    .asciz  "ABCDEFGHIJKLMNOPQRSUVWXYZ"
                .asciz  "abcdefghijklmnopqrstuvwxyz"
                .asciz  "1234567890AZERTYUIOP"
szMessTest2:    .asciz  "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
szMessFinPgm:   .asciz  "program berjalan dengan baik.\n"
szMessResult:   .asciz  "bellshade"
szCarriageReturn:   .asciz "\n"

tbConstHi:           .int 0x6A09E667       // H0
                     .int 0xBB67AE85       // H1
                     .int 0x3C6EF372       // H2
                     .int 0xA54FF53A       // H3
                     .int 0x510E527F       // H4
                     .int 0x9B05688C       // H5
                     .int 0x1F83D9AB       // H6
                     .int 0x5BE0CD19       // H7

tbConstKt:
  .int 0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5
  .int 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174
  .int 0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da
  .int 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967
  .int 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85
  .int 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070
  .int 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3
  .int 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2

.bss
.align 4
qNbBlocs:                    .skip 8
sZoneConv:                   .skip 24
sZoneTrav:                   .skip 1000
.align 8
tbH:                         .skip 4 * 8        
tbabcdefgh:                  .skip 4 * 8
tbW:                         .skip 4 * 64        

.text
.global main 
main:                                      
 
    ldr x0,qAdrszMessRosetta

    bl computeSHA256                       
 
    ldr x0,qAdrszMessResult
    bl affichageMess                       
 
    ldr x0, qAdrtbH
    bl displaySHA1
 
    ldr x0,qAdrszMessFinPgm
    bl affichageMess                       
 
 
100:                                       
    mov x0,0                               
    mov x8,EXIT                            
    svc 0                                  
 
qAdrszCarriageReturn:     .quad szCarriageReturn
qAdrszMessResult:         .quad szMessResult
qAdrszMessRosetta:        .quad szMessRosetta
qAdrszMessTest1:          .quad szMessTest1
qAdrszMessTest2:          .quad szMessTest2
qAdrsZoneTrav:            .quad sZoneTrav
qAdrsZoneConv:            .quad sZoneConv
qAdrszMessFinPgm:         .quad szMessFinPgm
qAdrszMessSup64:          .quad szMessSup64


computeSHA256:
computeSHA256:
    stp x1,lr,[sp,-16]!      
    ldr x1,qAdrsZoneTrav
    mov x2,#0                
debCopy:                     
    ldrb w3,[x0,x2]
    strb w3,[x1,x2]
    cmp x3,#0
    add x4,x2,1
    csel x2,x4,x2,ne
    bne debCopy
    lsl x6,x2,#3             
    mov x3,#0b10000000       
    strb w3,[x1,x2]
    add x2,x2,#1             
    lsl x4,x2,#3             
    mov x3,#0
addZeroes:
    lsr x5,x2,#6
    lsl x5,x5,#6
    sub x5,x2,x5
    cmp x5,#56
    beq storeLength         
    strb w3,[x1,x2]          
    add x2,x2,#1              
    add x4,x4,#8             
    b addZeroes
storeLength:
    add x2,x2,#4             
    rev w6,w6               
    str w6,[x1,x2]          
 
    ldr x7,qAdrtbConstHi     
    ldr x4,qAdrtbH           
    mov x5,#0
loopConst:                   
    ldr w6,[x7,x5,lsl #2]  
    str w6,[x4,x5,lsl #2]
    add x5,x5,#1
    cmp x5,#8
    blt loopConst
                            
    add x2,x2,#4            
    lsr x4,x2,#6            
    ldr x0,qAdrqNbBlocs
    str x4,[x0]              
    mov x7,#0 
loopBlock:                
    mov x0,x7
    bl inversion             
    ldr x3,qAdrtbW           
    mov x6,#0             
                        
    ldr x1,qAdrsZoneTrav
    add x2,x1,x7,lsl #6  
loopPrep:               
    cmp x6,#15          
    bgt expand1
    ldr w0,[x2,x6,lsl #2]    
    str w0,[x3,x6,lsl #2]    
    b expandEnd
 
expand1:
    sub x8,x6,#2
    ldr w9,[x3,x8,lsl #2]
    ror w10,w9,#17           
    ror w11,w9,#19
    eor w10,w10,w11
    lsr w11,w9,#10
    eor w10,w10,w11
    sub x8,x6,#7
    ldr w9,[x3,x8,lsl #2]
    add w9,w9,w10            
    sub x8,x6,#15
    ldr w10,[x3,x8,lsl #2]
    ror w11,w10,#7          
    ror w12,w10,#18
    eor w11,w11,w12
    lsr w12,w10,#3
    eor w10,w11,w12
    add w9,w9,w10
    sub x8,x6,#16
    ldr w11,[x3,x8,lsl #2]
    add w9,w9,w11
 
    str w9,[x3,x6,lsl #2] 
expandEnd:
    add x6,x6,#1
    cmp x6,#64                 
    blt loopPrep               

    ldr x0,qAdrtbH
    ldr x8,qAdrtbabcdefgh
    mov x1,#0

oopInita:
    ldr w9,[x0,x1,lsl #2]
    str w9,[x8,x1,lsl #2]
    add x1,x1,#1
    cmp x1,#8
    blt loopInita
 
 
    ldr x1,qAdrtbConstHi
    ldr x5,qAdrtbConstKt
    mov x6,#0

loop64T:                      
    ldr w9,[x8,#var_h]
    ldr w10,[x8,#var_e]      
    ror w11,w10,#6           
    ror w12,w10,#11
    eor w11,w11,w12
    ror w12,w10,#25
    eor w11,w11,w12
    add w9,w9,w11             
    ldr w0,[x8,#var_f]        
    ldr w4,[x8,#var_g]
    and w11,w10,w0
    mvn w12,w10
    and w12,w12,w4
    eor w11,w11,w12
    add w9,w9,w11             
    ldr w0,[x5,x6,lsl #2]     
    add w9,w9,w0
    ldr w0,[x3,x6,lsl #2]     
    add w9,w9,w0

    ldr w10,[x8,#var_a]       
    ror w11,w10,#2
    ror w12,w10,#13
    eor w11,w11,w12
    ror w12,w10,#22
    eor w11,w11,w12
    ldr w2,[x8,#var_b]
    ldr w4,[x8,#var_c]
 
    and w12,w10,w2
    and w0,w10,w4
    eor w12,w12,w0
    and w0,w2,w4
    eor w12,w12,w0            
    add w12,w12,w11           

    ldr w4,[x8,#var_g]
    str w4,[x8,#var_h]
    ldr w4,[x8,#var_f]
    str w4,[x8,#var_g]
    ldr w4,[x8,#var_e]
    str w4,[x8,#var_f]
    ldr w4,[x8,#var_d]
    add w4,w4,w9             
    str w4,[x8,#var_e]
    ldr w4,[x8,#var_c]
    str w4,[x8,#var_d]
    ldr w4,[x8,#var_b]
    str w4,[x8,#var_c]
    ldr w4,[x8,#var_a]
    str w4,[x8,#var_b]
    add w4,w9,w12         
    str w4,[x8,#var_a]
 
    add x6,x6,#1             
    cmp x6,#64
    blt loop64T

    ldr x0,qAdrtbH            
    mov x10,#0
loopStoreH:
    ldr w9,[x8,x10,lsl #2]
    ldr w3,[x0,x10,lsl #2]
    add w3,w3,w9
    str w3,[x0,x10,lsl #2]   
    add x10,x10,#1
    cmp x10,#8
    blt loopStoreH

    add x7,x7,#1                 
    ldr x0,qAdrqNbBlocs
    ldr x4,[x0]               
    cmp x7,x4                 
 
    blt loopBlock             
 
    mov x0,#0                
100:
    ldp x1,lr,[sp],16              
    ret                           
qAdrtbConstHi:            .quad tbConstHi
qAdrtbConstKt:            .quad tbConstKt
qAdrtbH:                  .quad tbH
qAdrtbW:                  .quad tbW
qAdrtbabcdefgh:           .quad tbabcdefgh
qAdrqNbBlocs:             .quad qNbBlocs



inversion:
    stp x1,lr,[sp,-16]!            
    stp x2,x3,[sp,-16]!            
    ldr x1,qAdrsZoneTrav
    add x1,x1,x0,lsl #6          
    mov x2,#0
1:                                                  
    ldr w3,[x1,x2,lsl #2]
    rev w3,w3
    str w3,[x1,x2,lsl #2]
    add x2,x2,#1
    cmp x2,#16
    blt 1b
100:
    ldp x2,x3,[sp],16              
    ldp x1,lr,[sp],16              
    ret                          



displaySHA1:
    stp x1,lr,[sp,-16]!            
    stp x2,x3,[sp,-16]!            
    mov x3,x0
    mov x2,#0
1:
    ldr w0,[x3,x2,lsl #2]          

    ldr x1,qAdrsZoneConv
    bl conversion16_4W             
    ldr x0,qAdrsZoneConv
    bl affichageMess
    add x2,x2,#1
    cmp x2,
    blt 1b                         
    ldr x0,qAdrszCarriageReturn
    bl affichageMess               
100:
    ldp x2,x3,[sp],16              
    ldp x1,lr,[sp],16              
    ret                            


conversion16_4W:
    stp x0,lr,[sp,-48]!        
    stp x1,x2,[sp,32]         
    stp x3,x4,[sp,16]          
    mov x2,#28                 
    mov x4,#0xF0000000         
    mov x3,x0                  
1:                             
    and x0,x3,x4               
    lsr x0,x0,x2               
    cmp x0,#10                 
    bge 2f                     
    add x0,x0,#48             
    b 3f
2:
    add x0,x0,#55              
3:
    strb w0,[x1],#1           
    lsr x4,x4,#4             
    subs x2,x2,#4              
    bge 1b                     
 
100:                          
    ldp x3,x4,[sp,16]          
    ldp x1,x2,[sp,32]         
    ldp x0,lr,[sp],48         
    ret    


.include "../includeARM64.inc"