# Filter Algorithm (Peterson Generalizado para N Procesos)

## Descripción

**idea** consiste en hacer que todos los procesos atraviesen una serie de **N-1 niveles** antes de ingresar a la sección crítica

En cada nivel:
- El proceso indica el nivel en el que se encuentra `level[i]`
- Se designa como la última víctima del nivel (`victim[level] = i`)
- Si existe otro proceso en el mismo nivel o superior y además sigue siendo la víctima, el proceso espera (busy wait)
- Si deja de ser la víctima o ya no existen procesos en ese nivel, continúa al siguiente

El último proceso que logra atravesar todos los niveles puede ingresar a la sección crítica


## Pseudocodigo

Variables Compartidas:
    level[0..N-1] := 0
    victim[1..N-1]

Proceso i:
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
