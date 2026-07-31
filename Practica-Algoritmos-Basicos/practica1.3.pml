active proctype main() {
    int i = 3;
    if 
        :: i == 0 -> printf("Valor ni positivo ni negativo\n");
        :: i > 0 -> printf("Valor positivo\n");
        :: i > 0 -> printf("Guarda no determinista\n");
        :: i < 0 -> printf("Valor negativo\n");
    fi
}