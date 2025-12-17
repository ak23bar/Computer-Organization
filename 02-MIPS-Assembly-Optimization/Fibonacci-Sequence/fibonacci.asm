# Set the initial number to a0
addi $a0, $zero, 10 # = n
# function fibonacci(n):
bgt $a0, 1, cont # Skip return logic if n>1
add $v0, $zero, $a0 # put n in return register v0
b end

cont:
# now continue normally
# use t0 = a
addi $t0, $zero, 0

# use t1 = b
addi $t1, $zero, 1

# use t2 = i
subi $t2, $a0, 1 # i = n - 1

loop:
# use t3 = temp
addi $t3, $t1, 0 # temp = b
add $t1, $t0, $t1 # b = a + b
addi $t0, $t3, 0 # a = temp

subi $t2, $t2, 1
# continue loop if i > 0
bgtz $t2 loop

# put b in return register v0
addi $v0, $t1, 0

end:
nop # use this nop to set a breakpoint to check values