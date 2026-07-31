bool ocupado = false;
bool dentroSCOne = false;
bool dentroSCTwo = false;

active proctype ProcessOne() {
    do
    :: !ocupado -> 
        ocupado = true;
        dentroSCOne = true; 
        assert(!(dentroSCOne && dentroSCTwo));
        printf("Proceso en la seccion critica \n");
        ocupado = false;
        dentroSCOne = false;
    od
}

active proctype ProcessTwo() {
    do
    :: !ocupado -> 
        ocupado = true;
        dentroSCTwo = true;
        assert(!(dentroSCOne && dentroSCTwo));
        printf("Proceso en la seccion critica \n");
        ocupado = false;
        dentroSCTwo = false;
    od
}