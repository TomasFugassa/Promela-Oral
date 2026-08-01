#define N 5
#define MAX_ROUNDS 1

int order[N];
bool choosingNumber[N];
byte inCriticalCount = 0;

active [N] proctype Process() {
    byte i = 0;
    byte j = 0;
    byte rounds = 0;
    byte max = 0;
    
    do 
    :: rounds < MAX_ROUNDS ->
        i = 0;
        j = 0;
        max = 0;
        choosingNumber[_pid] = true;

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
            choosingNumber[_pid] = false;
            break;
        od

        do
        :: i < N ->
            if
            :: i != _pid -> 
                !(choosingNumber[i])
                (order[_pid] < order[i] || (order[_pid] == order[i] && _pid < i) || order[i] == 0)
            :: else -> skip
            fi

            i++
        :: else -> break
        od

        inCriticalCount++;
        printf("Process %d is in critical section. In critical count: %d\n", _pid, inCriticalCount);
        assert(inCriticalCount <= 1);
        inCriticalCount--;

        order[_pid] = 0;
        rounds++;
    :: else -> break;
    od
}
