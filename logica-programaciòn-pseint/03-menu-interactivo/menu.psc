// Función para mostrar el inventario actual
SubProceso MostrarProductos(nombres, precios, cantidades)
    Escribir "--- Productos Disponibles ---"
    Para i <- 1 Hasta 3 Hacer
        Escribir i, ". ", nombres[i], " - $", precios[i], " (Cant: ", cantidades[i], ")"
    FinPara
    Escribir "-----------------------------"
FinSubProceso

// Función para procesar la compra 
SubProceso ComprarProducto(nombres, precios, cantidades)
    Definir opcion_prod Como Entero
    Escribir "Ingrese el número del producto que desea comprar (1-3):"
    Leer opcion_prod
    
    // Validación 1: Que el producto exista
    Si opcion_prod >= 1 Y opcion_prod <= 3 Entonces
        // Validación 2: Que haya stock disponible
        Si cantidades[opcion_prod] > 0 Entonces
            cantidades[opcion_prod] <- cantidades[opcion_prod] - 1
            Escribir "¡Compra exitosa! Disfruta tu ", nombres[opcion_prod], "."
        SiNo
            Escribir "Lo sentimos, actualmente no hay stock disponible de este producto."
        FinSi
    SiNo
        Escribir "Error: El producto seleccionado no existe en el catálogo."
    FinSi
FinSubProceso

// Función para abastecer la máquina con validación de valores positivos
SubProceso RecargarStock(nombres, cantidades)
    Definir opcion_prod, cantidad_recarga Como Entero
    Escribir "Ingrese el número del producto a recargar (1-3):"
    Leer opcion_prod
    
    // Validación 1: Que el producto exista
    Si opcion_prod >= 1 Y opcion_prod <= 3 Entonces
        Escribir "Ingrese la cantidad a recargar para ", nombres[opcion_prod], ":"
        Leer cantidad_recarga
        
        // Validación 2: Que la cantidad ingresada sea mayor a cero
        Si cantidad_recarga > 0 Entonces
            cantidades[opcion_prod] <- cantidades[opcion_prod] + cantidad_recarga
            Escribir "¡Recarga exitosa! El nuevo stock de ", nombres[opcion_prod], " es de ", cantidades[opcion_prod], " unidades."
        SiNo
            Escribir "Error: La cantidad a recargar debe ser obligatoriamente mayor que cero."
        FinSi
    SiNo
        Escribir "Error: El producto seleccionado no existe."
    FinSi
FinSubProceso

Proceso MaquinaExpendedora
    // Declaración de arreglos paralelos para manejar el inventario
    Definir nombres Como Caracter
    Definir precios, cantidades, opcion_menu Como Entero
    Dimension nombres[3], precios[3], cantidades[3]
    
    // Inicialización del stock 
    nombres[1] <- "Papas"
    precios[1] <- 2500
    cantidades[1] <- 5
    
    nombres[2] <- "Chocolatina"
    precios[2] <- 1800
    cantidades[2] <- 5
    
    nombres[3] <- "Galletas"
    precios[3] <- 2000
    cantidades[3] <- 5
    
    opcion_menu <- -1
    
    // Ciclo principal que mantiene la máquina encendida hasta que el usuario decida salir
    Mientras opcion_menu <> 0 Hacer
        Escribir ""
        Escribir "=== MÁQUINA EXPENDEDORA ==="
        Escribir "1) Ver productos disponibles"
        Escribir "2) Comprar un producto"
        Escribir "3) Recargar stock"
        Escribir "0) Salir"
        Escribir "==========================="
        Escribir "Elige una opción:"
        Leer opcion_menu
        
        Segun opcion_menu Hacer
            1:
                MostrarProductos(nombres, precios, cantidades)
            2:
                ComprarProducto(nombres, precios, cantidades)
            3:
                RecargarStock(nombres, cantidades)
            0:
                Escribir "¡Gracias por usar la máquina expendedora! Apagando sistema..."
            De Otro Modo:
                Escribir "Opción no válida. Por favor, selecciona una opción del menú."
        FinSegun
    FinMientras
FinProceso