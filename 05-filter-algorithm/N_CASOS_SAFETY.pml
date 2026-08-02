#define N 4
#define MAX_ROUNDS 1

byte levels[N];
byte victim[N];

byte inCriticalCount = 0;

active[N] proctype Process() {
    byte l;
    byte k;
    bool exists;
    byte rounds = 0;

    do 
    :: rounds < MAX_ROUNDS ->
        l = 1;

        do
        :: l < N ->
            levels[_pid] = l;
            victim[l] = _pid;

            do
            :: victim[l] == _pid ->
                k = 0;
                exists = false;

                do
                :: k < N ->
                    if
                    :: k != _pid && levels[k] >= l ->
                        exists = true;
                        break;
                    :: else -> skip;
                    fi

                    k++;
                :: else -> break;
                od

                if
                :: !exists -> break;
                :: else -> skip;
                fi

            :: else -> break;
            od

            l++;
        :: else -> break;
        od

        inCriticalCount++;
        printf("Process %d is in critical section\n", _pid);
        assert(inCriticalCount <= 1);
        inCriticalCount--;
        
        levels[_pid] = 0;
        rounds++;
    :: else -> break;
    od
}