# 1c2025 2do Recuperatorio - Ingeniería de Software I - Leveroni

## Sistema de Gestión de Biblioteca "BookWise"

**Una importante biblioteca universitaria** llamada "BookWise" necesita un **sistema para gestionar préstamos y calcular multas** basado en el tipo de usuario y las características de los libros prestados.

Tu tarea es desarrollar este sistema **desde cero usando TDD** (Test-Driven Development), implementando las funcionalidades requeridas, siguiendo todas las heurísticas de diseño vistas durante la cursada.

## Descripción del Negocio

**BookWise** maneja los siguientes elementos:

### 1. Tipos de Libros
- **Libro Regular**: Período de préstamo de 14 días, multa de $5 por día de atraso
- **Libro de Referencia**: Período de préstamo de 7 días, multa de $10 por día de atraso  
- **Libro Nuevo**: Período de préstamo de 10 días, multa de $8 por día de atraso

### 2. Tipos de Usuarios
- **Estudiante**: Puede tener hasta un libro prestado simultáneamente
- **Profesor**: Puede tener hasta 4 libros prestados simultáneamente
- **Bibliotecario**: Puede tener hasta 2 libros prestados simultáneamente

### 3. Cálculo de Multas
Las multas se calculan según estas reglas:
- **Estudiantes**: Pagan el 50% de la multa base del libro (tienen descuento por ser estudiante)
- **Profesores**: Pagan el 100% de la multa base del libro
- **Bibliotecarios**: Pagan el 25% de la multa base del libro (mayor descuento por ser personal)

### 4. Funcionalidades Requeridas

El sistema debe poder:
1. Registrar préstamos de libros a usuarios.
2. Verificar que un usuario no pueda tomar más libros prestados al alcanzar su máximo.
3. Permitir a los usuarios retornar libros prestados.
4. Consultar los días de atraso para préstamos vencidos
5. Calcular el monto total de multas por usuario

Para simplificar el examen, pueden IGNORAR las siguientes funcionalidades:
1. Verificar que un usuario no puede pedir un libro que fue prestado a otro
2. Verificar que un usuario no puede retornar un libro que nunca pidió prestado.

---


