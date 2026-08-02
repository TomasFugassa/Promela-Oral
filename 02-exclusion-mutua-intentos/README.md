# Propiedades

## Exclusion Mutua

Nunca puede haber más de un proceso ejecutando simultáneamente la sección crítica

## Ausencia de deadlock

Si uno o más procesos desean ingresar a la sección crítica, el sistema nunca debe quedar completamente bloqueado, 
es decir debe seguir existiendo progreso en algun proceso

## Ausencia de inanición (No Starvation)

Todo proceso que solicite ingresar a la sección crítica debe poder hacerlo eventualmente

## Progreso (Liveness)

Si ningún proceso está utilizando la sección crítica y existe algún proceso que desea entrar, alguno de ellos debe poder avanzar

# Intentos

## Intento 1 – Alternancia estricta

**Idea:** Utilizar una variable `turn` para indicar qué proceso puede ingresar a la sección crítica

**Resultado:**
- Garantiza exclusión mutua
- Viola la propiedad de progreso: un proceso puede quedar esperando indefinidamente aunque el otro no quiera entrar a la sección crítica

## Intento 2 – Consultar antes de anunciar intención

**Idea:** Cada proceso verifica si el otro desea entrar antes de indicar su propia intención

**Resultado:**
- No garantiza exclusión mutua
- Es posible que ambos procesos observen que el otro no quiere entrar y accedan simultáneamente a la sección crítica debido a una condición de carrera

## Intento 3 – Anunciar intención antes de consultar

**Idea:** Cada proceso primero indica que desea entrar y luego verifica si el otro proceso también quiere ingresar

**Resultado:**
- Garantiza exclusión mutua
- Puede producir **deadlock**: si ambos procesos levantan su bandera al mismo tiempo, ambos esperan indefinidamente a que el otro la baje

## Intento 4 – Cortesía (Livelock)

**Idea:** Si un proceso detecta que el otro también desea entrar, retira temporalmente su intención y vuelve a intentarlo

**Resultado:**
- Evita el deadlock del intento anterior
- Puede producir **livelock**: ambos procesos continúan ejecutándose, retirando y levantando sus banderas repetidamente, pero ninguno logra ingresar a la sección crítica
