# Set the initial number to a0
addi $a0, $zero, 31  
# function odd(n):
# returns 1 if odd 0 if even

add $v0, $a0, $zero # use v0 = remainder

loop:
blt $v0, 2, end  # If remainder < 2, exit the loop
subi $v0, $v0, 2  
b loop

# no need to move anything since remainder is already v0
end:
nop