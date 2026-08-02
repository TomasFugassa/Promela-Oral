byte valores[3];

active proctype main(){
    valores[0] = 1;
    valores[1] = 2;
    valores[2] = 3;
}

active proctype main2(){
    printf("Valor de valores[0] = %d\n", valores[0]);
    printf("Valor de valores[1] = %d\n", valores[1]);
    printf("Valor de valores[2] = %d\n", valores[2]);
}