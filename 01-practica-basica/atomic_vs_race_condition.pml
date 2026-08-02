byte i = 0;

active proctype main() {
    atomic {
        i = 1;
        printf("Valor de i = %d\n", i);
    } 
    
}

active proctype main2() {
    atomic {
        i = 2;
        printf("Valor de i = %d\n", i);
    }
}
