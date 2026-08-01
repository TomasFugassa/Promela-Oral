#define N 3
bool want[N];
int order[N];

bool inCriticalCount = 0;

active [N] proctype Process() {
    byte i = 0;
    byte j = 0;
    int max = 0;
    
    do 
    :: true ->
        i = 0;
        want[_pid] = true;

        do
        :: i < N ->
            j = 0;

            do
            :: j < N ->
                if
                :: order[j] > max ->
                    max = order[j];
                fi
                j++;
            :: else -> 
                order[_pid] = max + 1;
                break;
            od

            if
            :: i != _pid -> 
                if
                :: want[i] -> 
                    
                :: else -> skip
                fi
            :: else -> skip
            fi

            i++
        :: else -> break
        od

        inCriticalCount++;
        // Critical Section
        want[_pid] = false;
        inCriticalCount--;
    :: else -> skip
    od
}
