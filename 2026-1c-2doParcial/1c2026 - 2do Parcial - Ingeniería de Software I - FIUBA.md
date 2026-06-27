# 1c2026 \- 2do Parcial \- Ingeniería de Software I \- FIUBA

# Vet Móvil: Campaña Sanitaria Itinerante

Una organización veterinaria está desarrollando un sistema para coordinar **brigadas móviles de atención animal**. Estas brigadas recorren refugios, barrios y zonas rurales realizando tratamientos básicos a animales que todavía no pueden ser trasladados a una clínica.

El objetivo es modelar el comportamiento de las brigadas durante una jornada de trabajo, según las reglas que se describen a continuación.

## Atención de animales

Las brigadas van visitando distintos puntos de atención y realizan tratamientos sobre los animales que encuentran. Cada vez que una brigada atiende a un animal, registra esa atención en una planilla provisoria que luego deberá ser rendida en una base sanitaria.

Se debe registrar el tipo de tratamiento realizado (vacunación o curación, por el momento) y los insumos utilizados.

Cada brigada cuenta con un **maletín sanitario**, donde lleva los insumos necesarios para realizar los tratamientos.

Por el momento, las **atenciones sanitarias** constan de un único tratamiento, aunque a futuro se espera que pueda soportar múltiples tratamientos.

## Estados de una brigada

Las brigadas pueden encontrarse en 4 estados posibles:

* **Operativa**: la brigada puede trabajar normalmente.  
* **Sin conexión**: la brigada puede atender animales, pero no puede enviar ni rendir información porque no tiene conexión con el sistema central.  
* **Instrumental comprometido**: la brigada puede seguir trabajando, pero su instrumental presenta fallas o desgaste.  
* **En cuarentena**: la brigada queda bloqueada y no puede realizar trabajo de campo.

Una brigada **no puede atender animales** si está en cuarentena.

A futuro, es esperable que se agreguen nuevas reglas relacionadas con los estados. Por ejemplo, ciertos tratamientos podrían no permitirse si la brigada tiene el instrumental comprometido.

## Tratamientos e insumos

Existen 2 tipos de tratamientos:

* **Vacunaciones**  
* **Curaciones**

Cada tratamiento tiene una cantidad de insumos requerida. Dos tratamientos del mismo tipo no necesariamente requieren la misma cantidad de insumos.

Esta es una simplificación del dominio real, pero alcanza para esta primera versión. Más adelante podrían incorporarse otros tratamientos, como desparasitación, toma de muestras o controles postoperatorios.

El maletín sanitario de una brigada tiene dos reservas configurables:

* Cantidad de **dosis refrigeradas** disponibles.  
* Cantidad de **material estéril** disponible.

Las **vacunaciones** consumen dosis refrigeradas. Para poder realizar una vacunación, la brigada debe tener suficientes dosis refrigeradas en su maletín.

Las **curaciones** consumen material estéril. Para poder realizar una curación, la brigada debe tener suficiente material estéril en su maletín.

Notar que cada tipo de tratamiento consume solamente el insumo que le corresponde. Para hacer una vacunación no importa cuánto material estéril quede, y para hacer una curación no importa cuántas dosis refrigeradas queden.

La organización está evaluando otros tipos de maletines a futuro.

### Ejemplos

* Una brigada con un maletín que tiene 10 dosis refrigeradas y 5 unidades de material estéril puede realizar una vacunación que requiere 8 dosis refrigeradas, pero no puede realizar una vacunación que requiere 11 dosis.  
* Una brigada con 3 dosis refrigeradas y 12 unidades de material estéril puede realizar una curación que requiere 10 unidades de material estéril, aunque no tenga suficientes dosis para vacunar.  
* Una brigada con 6 unidades de material estéril podría realizar dos curaciones de 3 unidades cada una. Luego de eso, no podría realizar otra curación que requiera material estéril, salvo que el maletín sea repuesto.

## Exposición sanitaria

Además de consumir insumos, cada atención genera un cierto nivel de **exposición sanitaria** para la brigada. Esto representa suciedad, riesgo de contaminación, manipulación de animales heridos, contacto con fluidos, etc.

Cada brigada tiene un máximo de exposición sanitaria tolerable durante la jornada.

La exposición generada por una atención se calcula de la siguiente manera:

* Una vacunación genera **1 unidad de exposición** por cada dosis refrigerada utilizada.  
* Una curación genera **2 unidades de exposición** por cada unidad de material estéril utilizada.

Por ejemplo:

* Una vacunación que usa 5 dosis refrigeradas genera 5 unidades de exposición.  
* Una curación que usa 5 unidades de material estéril genera 10 unidades de exposición.

Si una brigada no puede realizar una atención porque superaría su máximo de exposición sanitaria, entonces no realiza la atención y queda en estado **En cuarentena**. En este estado, no puede realizar una nueva atención, incluso si la misma no implica superar la máxima exposición sanitaria.

Por ejemplo:

1. Una brigada con máximo de exposición 2 **vacuna** una animal con una dosis (consumiendo 1 unidad de exposición).  
2. Luego intenta **curar** al animal, pero no puede, dado que superaría el máximo de exposición. En ese instante, pasa a estar **En cuarentena**. Notar que no consume el insumo en este caso (material esteril). Notar también que la exposición generada no se debe incrementar.  
3. Luego intenta **vacunar** a otro animal. En principio podría hacerlo porque le queda 1 unidad de exposición sanitaria, pero no puede por estar **En cuarentena**. Tampoco consume la dosis de la vacuna en este caso.

Por último, si la brigada tiene el **Instrumental comprometido**, la exposición generada por cualquier atención **se triplica**.

## Rendición de atenciones

Luego de atender uno o más animales, la brigada puede dirigirse a una **base sanitaria** para rendir las atenciones realizadas.

Existen varias bases sanitarias, y cuál se utiliza se decide en el momento de la rendición.

Al rendir, todas las atenciones registradas en la planilla provisoria de la brigada quedan almacenadas en la base sanitaria asignada y la planilla se vacía.

Una brigada **no puede rendir atenciones** cuando se encuentra en estado **Sin conexión**.

Además, si una brigada rinde atenciones estando en estado **Instrumental comprometido**, luego de la rendición queda en estado **En cuarentena**.

---

# Trabajo a realizar

El examen se debe realizar mediante **TDD**, siguiendo las heurísticas de diseño vistas durante la cursada.

En el modelo final deben pasar todos los tests desarrollados.

Quitar código repetido de los tests sólo sumará algún punto extra. No es necesario para llegar al 10\.

---

# Entrega

1. Entregar el fileout de la categoría de clase **1c2026-2doParcial** que debe incluir toda la solución (modelo y tests). El archivo de fileout se debe llamar: **1c2026-2doParcial.st**  
2. Entregar también el archivo que se llama **CuisUniversity-nnnn.user.changes**  
3. Probar que el archivo generado en 1\) se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon. Usen otra instalación de CuisUniversity/imagen si es necesario) y que todo funcione correctamente. Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega.  
4. Deben realizar la entrega enviando mail a: **fiuba-ingsoft1-doc@googlegroups.com** con el **Subject: Padrón NNNNN \- Solución 2do parcial 1c2026.**   
   En caso de rebotar el envío, reintentar comprimiendo los adjuntos.  
5. **RECOMENDACIÓN IMPORTANTE: Salvar la imagen de manera frecuente o con el autosave**   
6. Se asume que a esta altura de la cursada saben trabajar con la imagen, recuperarla, recuperar código fuente, revertir cambios y demás incidencias que pudieran ocurrir durante el exámen.

**Revisen bien los puntos de arriba. Cualquier error en los nombres o formato podrían ser penalizados en la nota.**

**IMPORTANTE:** **No retirarse sin tener el ok de los docentes** de haber recibido la resolución por algún medio.  
**CERRAR EL TRABAJO A LAS 21:20.  LAS ENTREGAS RECIBIDAS DESPUÉS DE LAS 21:30 HRS NO SERÁN TENIDAS EN CUENTA**