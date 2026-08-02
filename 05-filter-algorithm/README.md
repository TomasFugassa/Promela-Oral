

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
                busy wait
            }
        }

        Critical Section 

        level[i] = 0 
    }
}
