byte i = 0;

active proctype main() {
    do 
    :: i < 5 -> i = i + 1;
       printf("Valor de i = %d\n", i);
    :: i >= 5 -> break;
    od
}
