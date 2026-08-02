bool wantOne = false;
bool wantTwo = false;

active proctype ProcessOne() {
    do
    :: true ->
        wantOne = true;

        do
        :: wantTwo ->
            wantOne = false;
            wantOne = true

        :: else ->
            break
        od;

        printf("Process One is in critical section\n");

        wantOne = false
    od
}

active proctype ProcessTwo() {
    do
    :: true ->
        wantTwo = true;

        do
        :: wantOne ->
            wantTwo = false;
            wantTwo = true

        :: else ->
            break
        od;

        printf("Process Two is in critical section\n");

        wantTwo = false
    od
}