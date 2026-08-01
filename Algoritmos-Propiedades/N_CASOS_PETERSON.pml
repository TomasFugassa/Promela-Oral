#define N 4

byte levels[N];
byte victim[N];

byte inCriticalCount = 0;

ltl CS_EVENTUALLY { [] <> (inCriticalCount > 0) }
ltl CS_EVENTUALLY_FREE { [] ((inCriticalCount > 0) -> <> (inCriticalCount == 0)) }

ltl CS_SAFETY { [] (inCriticalCount <= 1) }

ltl P0_WANT_TO_ENTER { [] <> (levels[0] > 0) }
ltl P0_REACH_SC { [] ((levels[0] > 0) -> <> (levels[0] == 0)) }

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
            progressVictim:
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

            progressLevel:
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

/*
Pseudocode:
Shared:
    level[0..N-1] := 0
    victim[1..N-1]

Process i:
    while (true) {
        for (L = 1; L < N; L++) {
            level[i] = L;
            victim[L] = i;

            while (∃ k ≠ i
                level[k] >= L
                && victim[L] == i)
            {
                // busy wait
            }
        }

        /* Critical Section */

        /* level[i] = 0 */
    /*}
}
*/