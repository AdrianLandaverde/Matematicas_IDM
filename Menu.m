disp("Hola, aquí puedes calcular algunas de las cosas de mate que hemos visto")
disp("¿Qué deseas calcular?")
disp("1. Gradiente")
disp("2. Ecuación Plano Tangente")
disp("3. Conversión a coordenadas Polares")
disp("4. Derivadas")
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
        Derivada();
    otherwise
        disp("Opción Inválida");
end