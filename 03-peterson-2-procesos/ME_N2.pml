bool wantOne = false;
bool wantTwo = false;
byte last = 1;

bool inCriticalSectionOne = false;
bool inCriticalSectionTwo = false;

ltl MUTEX { [] !(inCriticalSectionOne && inCriticalSectionTwo) };
ltl GLOBAL_PROGRESS { [] <> (inCriticalSectionOne || inCriticalSectionTwo) };
ltl LOCAL_PROGRESS_ONE { [] <> inCriticalSectionOne };
ltl LOCAL_PROGRESS_TWO{ [] <> inCriticalSectionTwo };

active proctype ProcessOne() {
    do
    :: true -> 
        wantOne = true;
        last = 1;

        if
        :: !wantTwo || last == 2
        fi

    progressOne:
        inCriticalSectionOne = true;
        printf("Proceso en la seccion critica \n");
        inCriticalSectionOne = false;

        wantOne = false;
    od
}

active proctype ProcessTwo() {
    do
    :: true -> 
        wantTwo = true;
        last = 2;

        if
        :: !wantOne || last == 1
        fi

    progressTwo:
        inCriticalSectionTwo = true;
        printf("Proceso en la seccion critica \n");
        inCriticalSectionTwo = false;

        wantTwo = false;
    od
}
