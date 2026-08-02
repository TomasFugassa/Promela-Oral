# Peterson

## Idea

- want[] indica intención la intencion de ingresar a la seccion critica
- last se utiliza para desempatar cuando ambos procesos quieren entrar al mismo tiempo
- El último proceso que modifica `last` cede el paso al otro proceso
- Un proceso solo espera si el otro tambien quiere entrar y ademas es su turno de esperar 

## Garantiza

• Safety:
    - Exclusión mutua

• Liveness:
    - Progreso
    - Ausencia de deadlock
    - Ausencia de starvation
