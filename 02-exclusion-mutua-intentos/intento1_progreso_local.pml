byte turn = 1;

active proctype processOne() {
    do
    :: turn == 1 ->
            printf("Proceso 1 en la seccion critica \n");
            turn = 2;
    :: else -> skip;
    od
}

active proctype processTwo() {
    do
    :: turn == 2 ->
            printf("Proceso 2 en la seccion critica \n");
            turn = 1;
    :: else -> skip;
    od
}