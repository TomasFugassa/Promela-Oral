active proctype main() {
    int intentos = 0;
    do
    :: intentos < 3 -> 
        printf("Intento %d\n", intentos + 1);
        intentos = intentos + 1;
    :: intentos >= 3 ->
        printf("Sin intentos restantes\n");
        break;
    od
}