disp("Hola, aquí puedes calcular algunas de las cosas de mate que hemos visto")
disp("¿Qué deseas calcular?")
disp("1. Gradiente")
disp("2. Ecuación Plano Tangente")
disp(" ")
opcion= input("Ingrese el número de la opción: ");
switch(opcion)
    case 1
        Gradiente();
    case 2
        PlanoTangente();
    otherwise
        disp("Opción Inválida");
end