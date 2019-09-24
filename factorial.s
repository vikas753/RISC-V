mul:                               
    addi    sp, sp, -32
    sw      ra, 28(sp)
    sw      s0, 24(sp)
    addi    s0, sp, 32
    sw      a0, -12(s0)
    sw      a1, -16(s0)
    mv      a0, zero
    sw      a0, -20(s0)
    sw      a0, -24(s0)
    j       .LBB0_1
.LBB0_1:                                
    lw      a0, -24(s0)
    lw      a1, -16(s0)
    bge     a0, a1, .LBB0_4
    j       .LBB0_2
.LBB0_2:                                
    lw      a0, -20(s0)
    lw      a1, -12(s0)
    add     a0, a0, a1
    sw      a0, -20(s0)
    j       .LBB0_3
.LBB0_3:                                
    lw      a0, -24(s0)
    addi    a0, a0, 1
    sw      a0, -24(s0)
    j       .LBB0_1
.LBB0_4:
    lw      a0, -20(s0)
    lw      s0, 24(sp)
    lw      ra, 28(sp)
    addi    sp, sp, 32
    ret
factorial:                         
    addi    sp, sp, -32
    sw      ra, 28(sp)
    sw      s0, 24(sp)
    addi    s0, sp, 32
    sw      a0, -12(s0)
    addi    a0, zero, 1
    sw      a0, -16(s0)
    sw      a0, -20(s0)
    j       .LBB1_1
.LBB1_1:                                
    lw      a0, -20(s0)
    lw      a1, -12(s0)
    blt     a1, a0, .LBB1_4
    j       .LBB1_2
.LBB1_2:                                
    lw      a0, -16(s0)
    lw      a1, -20(s0)
    call    mul
    sw      a0, -16(s0)
    j       .LBB1_3
.LBB1_3:                                
    lw      a0, -20(s0)
    addi    a0, a0, 1
    sw      a0, -20(s0)
    j       .LBB1_1
.LBB1_4:
    lw      a0, -16(s0)
    lw      s0, 24(sp)
    lw      ra, 28(sp)
    addi    sp, sp, 32
    ret
main:                                   
    addi    sp, sp, -32
    sw      ra, 28(sp)
    sw      s0, 24(sp)
    addi    s0, sp, 32
    mv      a0, zero
    sw      a0, -12(s0)
    addi    a1, zero, 12
    sw      a0, -20(s0)
    add     a0, zero, a1
    call    factorial
    sw      a0, -16(s0)
    lw      s0, 24(sp)
    lw      ra, 28(sp)
    addi    sp, sp, 32
    ret