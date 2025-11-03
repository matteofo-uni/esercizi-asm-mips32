# Scrivere un programma assembly che calcoli il valore assoluto di un numero intero. 
# A tale scopo, utilizzare ad esempio il registro $t0 e inserirvi un valore. 
# Il programma dovra' avere un comportamento diverso se tale valore e' positivo o negativo.
# Provare entrambe le situazioni. 
    .data
numero: .word 10 # definisco numero = 10
    .text
    .globl main
main:
    la $a0, numero # trovo dove abita il numero
    lw $t0, 0($a0) # vado a trovarlo ($t0 = 10)
    
    blt $t0, $zero, negativo
    # positivo
    j end
negativo:
    # va qui
    li $t1, -1

    mul $t0, $t0, $t1
    j end

end:
    move $a0, $t0 # addiu $a0, $zero, $t0
    li $v0, 1 # print_int, stampa i contenuti di a0
    syscall

    li $v0, 10 # exit
    syscall