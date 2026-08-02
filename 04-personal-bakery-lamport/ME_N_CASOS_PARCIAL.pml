#define N 3
#define MAX_ROUNDS 3

bool want[N];
int order[N];

byte inCriticalCount = 0;

active [N] proctype Process() {
    byte i = 0;
    byte j = 0;
    byte rounds = 0;
    int max = 0;
    
    do 
    :: rounds < MAX_ROUNDS ->
        j = 0;
        max = 0;
        want[_pid] = true;

        do
        :: j < N ->
            if
            :: order[j] > max ->
                max = order[j];
            :: else -> skip;
            fi
            j++;
            
        :: else -> 
            order[_pid] = max + 1;
            break;
        od

        i = 0;

        do
        :: i < N ->
            if
            :: i != _pid -> 
                if
                :: want[i] -> 
                    (order[i] != 0)
                    (order[_pid] < order[i] || (order[_pid] == order[i] && _pid < i))
                :: else -> skip
                fi
            :: else -> skip
            fi

            i++
        :: else -> break
        od

        inCriticalCount++;
        printf("Process %d is in critical section. In critical count: %d\n", _pid, inCriticalCount);
        assert(inCriticalCount <= 1);
        inCriticalCount--;

        want[_pid] = false;
        order[_pid] = 0;
        rounds++;
    :: else -> break;
    od
}