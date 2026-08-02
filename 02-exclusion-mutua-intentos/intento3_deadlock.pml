bool wantOne = false;
bool wantTwo = false;

active proctype ProcessOne() {
    do
    :: true ->
        wantOne = true;

        (!wantTwo)
        progressCriticalSectionOne:
            printf("Process One is in critical section\n");
            wantOne = false;
    :: else -> skip;
    od
}

active proctype ProcessTwo() {
    do
    :: true ->
        wantTwo = true;

        (!wantOne)
        progressCriticalSectionTwo:
            printf("Process Two is in critical section\n");
            wantTwo = false;
    :: else -> skip;
    od
}