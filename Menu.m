disp("Hola, aquí puedes calcular algunas de las cosas de mate que hemos visto")
disp("¿Qué deseas calcular?")
disp("1. Gradiente")
disp("2. Ecuación Plano Tangente")
disp("3. Conversión a coordenadas Polares")
disp("4. Conversión a coordenadas Cilíndricas")
disp("5. Conversión a coordenadas Esféricas")
disp("6. Derivadas")
disp("7. Integrales")
disp("8. Operaciones con Vectores")
disp(" ")
opcion= input("Ingrese el número de la opción: ");
switch(opcion)
    case 1
        Gradiente();
    case 2
        PlanoTangente();
    case 3
        CoordenadasPolares();
    case 4
        CoordenadasCilindricas();
    case 5
        CoordenadasEsfericas();
    case 6
        Derivada();
    case 7
        Integral();
    case 8
        Vectores();
    otherwise
        disp("Opción Inválida");
end