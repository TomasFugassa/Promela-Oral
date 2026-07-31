bool wantOne = false;
bool wantTwo = false;
byte turn = 1;

bool inCriticalSectionOne = false;
bool inCriticalSectionTwo = false;

active proctype ProcessOne() {
    do
    :: true -> 
        wantOne = true;
        turn = 1;

        if
        :: !wantTwo || turn == 1
        fi

        inCriticalSectionOne = true;
        assert(!(inCriticalSectionOne && inCriticalSectionTwo));
        printf("Proceso en la seccion critica \n");
        
        inCriticalSectionOne = false;
        wantOne = false;
    od
}

active proctype ProcessTwo() {
    do
    :: true -> 
        wantTwo = true;
        turn = 2;

        if
        :: !wantOne || turn == 2
        fi

        inCriticalSectionTwo = true;
        assert(!(inCriticalSectionOne && inCriticalSectionTwo));
        printf("Proceso en la seccion critica \n");

        inCriticalSectionTwo = false;
        wantTwo = false;
    od
}
