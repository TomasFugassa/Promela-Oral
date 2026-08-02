#define N 4

byte levels[N];
byte victim[N];

byte inCriticalCount = 0;

ltl CS_EVENTUALLY { [] <> (inCriticalCount > 0) }
ltl CS_EVENTUALLY_FREE { [] ((inCriticalCount > 0) -> <> (inCriticalCount == 0)) }

ltl P0_REACH_SC { [] ((levels[0] > 0) -> <> (levels[0] == 0)) }
ltl P0_WANT_TO_ENTER { [] <> (levels[0] > 0) }

active[N] proctype Process() {
    byte l;
    byte k;
    bool exists;

    do 
    :: true ->
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

        progressCriticalSection:
            inCriticalCount++;
            printf("Process %d is in critical section\n", _pid);
            assert(inCriticalCount <= 1);
            inCriticalCount--;
            levels[_pid] = 0;
    od
}
