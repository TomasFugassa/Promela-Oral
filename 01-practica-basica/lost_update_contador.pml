byte contador = 0;
bool finishedOne = false;
bool finishedTwo = false;

active proctype processOne() {
    byte i = 0;

    do 
    :: i <= 9 -> 
            byte temp = contador;
            temp = temp + 1;
            contador = temp;
            i = i + 1;
       printf("Valor de contador = %d\n", contador);
    :: i > 9 -> break;
    od

    finishedOne = true;
}

active proctype processTwo() {
    byte i = 0;

    do
    :: i <= 9 -> 
            byte temp = contador;
            temp = temp + 1;
            contador = temp;
            i = i + 1;
       printf("Productor: producido %d\n", contador);
    :: i > 9 -> 
        printf("Productor: contador máximo alcanzado.\n");
        break;
    od

    finishedTwo = true;
}

init {
    do
    :: finishedOne && finishedTwo -> 
        printf("Finalizando procesos.\n");
        break;
    od

    assert(contador == 20);
}