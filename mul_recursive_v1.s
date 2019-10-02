mul:                               
    addi    sp, sp, -32
    sw      ra, 28(sp)
    sw      s0, 24(sp)
    addi    s0, sp, 32
    sw      a0, -16(s0)
    sw      a1, -20(s0)
    lw      a0, -16(s0)
    mv      a1, zero
	#check if operand 2 is zero to exit from recursive tree
    beq     a0, a1, .LBB0_2
    j       .LBB0_1
.LBB0_1:
    lw      a0, -20(s0)
    mv      a1, zero
    bne     a0, a1, .LBB0_3
    j       .LBB0_2
.LBB0_2:
    mv      a0, zero
    sw      a0, -12(s0)
    j       .LBB0_4
.LBB0_3:
    # add the number to itself and then decrement operand 2 
	# recursively call multiply api again with above operands
    lw      a0, -16(s0)
    lw      a1, -20(s0)
    addi    a1, a1, -1
    sw      a0, -24(s0)
    call    mul
    lw      a1, -24(s0)
    add     a0, a0, a1
    sw      a0, -12(s0)
    j       .LBB0_4
.LBB0_4:
    lw      a0, -12(s0)
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
	#operand 1
    addi    a1, zero, 10
    sw      a1, -16(s0)
    #operand 2
	addi    a1, zero, 20
    sw      a1, -20(s0)
    lw      a1, -16(s0)
    lw      a2, -20(s0)
    sw      a0, -28(s0)
    add     a0, zero, a1
    add     a1, zero, a2
    call    mul
    sw      a0, -24(s0)
    lw      s0, 24(sp)
    lw      ra, 28(sp)
    addi    sp, sp, 32
    ret