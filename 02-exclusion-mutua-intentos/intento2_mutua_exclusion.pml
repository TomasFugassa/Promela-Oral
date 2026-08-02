bool wantOne = false;
bool wantTwo = false;

bool inCriticalOne = false;
bool inCriticalTwo = false;

active proctype ProcessOne() {
    do
    :: true ->
        (!wantTwo);
        wantOne = true;
        inCriticalOne = true;
        assert(!(inCriticalOne && inCriticalTwo));
        printf("Process One is in critical section\n");
        inCriticalOne = false;
        wantOne = false;
    :: else -> skip;
    od
}

active proctype ProcessTwo() {
    do
    :: true ->
        (!wantOne);
        wantTwo = true;
        inCriticalTwo = true;
        assert(!(inCriticalOne && inCriticalTwo));
        printf("Process Two is in critical section\n");
        inCriticalTwo = false;
        wantTwo = false;
    :: else -> skip;
    od
}