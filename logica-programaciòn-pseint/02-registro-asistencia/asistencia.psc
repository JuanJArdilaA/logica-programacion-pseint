Funcion es_valido <- validar_asistencia(valor)
    Si valor == 0 O valor == 1 Entonces
        es_valido <- Verdadero
    Sino
        es_valido <- Falso
    Fin Si
Fin Funcion

Algoritmo RegistroEstudiantes
    Definir n, i, valor, asistentes, ausentes Como Entero
    asistentes <- 0
    ausentes <- 0
    
    Escribir "Ingrese la cantidad de estudiantes (n): "
    Leer n
    
    Para i <- 1 Hasta n Con Paso 1 Hacer
        Escribir "--- Registro del Estudiante ", i, " ---"
        Repetir
            Escribir "Ingrese el valor de asistencia (1 = asistió, 0 = no asistió): "
            Leer valor
            
            Si No validar_asistencia(valor) Entonces
                Escribir "Error: Valor incorrecto. Debe ingresar únicamente 0 o 1."
            Fin Si
            
        Hasta Que validar_asistencia(valor) == Verdadero
        
        Si valor == 1 Entonces
            asistentes <- asistentes + 1
        Sino
            ausentes <- ausentes + 1
        Fin Si
    Fin Para
    
    Escribir "=== Resumen Final de Asistencia ==="
    Escribir "Número de asistentes: ", asistentes
    Escribir "Número de ausentes: ", ausentes
    
Fin Algoritmo