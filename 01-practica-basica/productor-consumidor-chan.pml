chan c = [3] of {byte};

active proctype Productor() {
    do
    :: c!1;
       printf("Productor: producido 1\n");
    :: c!2;
       printf("Productor: producido 2\n");
    :: c!3;
       printf("Productor: producido 3\n");
    :: full(c) -> 
        printf("Productor: buffer lleno.\n");
        break;
    od
}

active proctype Consumidor() {
    byte valor;
    do
    :: c?valor;
       printf("Consumidor: consumido %d\n", valor);
    :: empty(c) -> 
        printf("Consumidor: buffer vacío.\n");
        break;
    od
}