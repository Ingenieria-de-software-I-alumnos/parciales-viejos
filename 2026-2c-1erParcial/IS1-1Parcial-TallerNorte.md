# Ingeniería de Software I — FIUBA

## 2c 2026 - 1er Parcial — Taller Norte

Taller Norte utiliza un sistema para registrar las operaciones de sus máquinas y **determinar qué mantenimiento necesitan según el desgaste acumulado**. Una indicación de mantenimiento especifica la intervención, la cantidad de visitas técnicas y la duración de cada visita. Las máquinas tienen una cantidad de piezas que influye en la duración del reacondicionamiento.

El sistema fue desarrollado por una persona que ya no trabaja en el taller y ahora te toca mantenerlo. Dejó una suite de tests, pero también código repetido y problemas de diseño.

### Por dónde empezar

El archivo `IS1-1Parcial-TallerNorte.st` contiene la implementación inicial y la clase `TestMantenimientoDelTaller`. **Leé y ejecutá los tests para entender las reglas de negocio antes de refactorizar.** Están organizados de la siguiente manera:

- **01 al 03:** registro de operaciones por máquina.
- **04 al 07:** cálculo del desgaste.
- **08 al 12:** elección del mantenimiento según el desgaste.
- **13 al 21:** cantidad de visitas y duración según la intervención, el tipo de máquina y la cantidad de piezas.

En cada test, observá qué escenario se prepara, qué mensaje se envía y qué resultado se espera. Consultá la implementación para completar tu comprensión.

### Referencia rápida de las reglas de negocio

Cada operación **estándar suma 15 puntos** de desgaste y cada **intensiva suma 40**. El desgaste se acumula por máquina; sin operaciones es 0.

La tabla indica la **duración de cada visita**, en minutos. **P** es la cantidad de piezas de la máquina.

| Desgaste acumulado     | Intervención        | Visitas | Cinta transportadora |  Torno | Prensa |
| ---------------------- | ------------------- | ------: | -------------------: | -----: | -----: |
| Menos de 60            | No corresponde      |       — |                    — |      — |      — |
| De 60 a 100, inclusive | Inspección          |       1 |                   40 |     60 |     80 |
| Más de 100             | Reacondicionamiento |       2 |               15 × P | 30 × P | 50 × P |

Las dos visitas del reacondicionamiento tienen la duración indicada; no se divide entre ellas.

### Trabajo a realizar

Tu tarea es **refactorizar el código, preservando el comportamiento del sistema**:

- Eliminar el código repetido entre los tests **01 al 03**.
- Eliminar el código repetido entre los tests **13 al 21**.
- **Identificar y corregir las deficiencias de diseño del modelo** aplicando las heurísticas vistas durante la cursada.
