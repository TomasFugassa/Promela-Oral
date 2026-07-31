#define N 5
bool want[N];

active [N] proctype Process() {
    byte i = 0;
    
    do 
    :: true ->
        want[_pid] = true;
        i = 0;

        do
        :: i < N ->
            if
            :: i != _pid -> 
                if
                :: want[i] -> 
                    //aca me falta el codigo para que el proceso espere a que el otro termine o algo asi
                :: else -> skip
                fi
            :: else -> skip
            fi

            i++
        :: else -> break
        od
        
        want[_pid] = false;
    od
}
