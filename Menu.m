disp("Hola, aquí puedes calcular algunas de las cosas de mate que hemos visto")
disp("¿Qué deseas calcular?")
disp("1.  Gradiente")
disp("2.  Ecuación Plano Tangente")
disp("3.  Conversión a coordenadas Polares")
disp("4.  Conversión a coordenadas Cilíndricas")
disp("5.  Conversión a coordenadas Esféricas")
disp("6.  Derivadas")
disp("7.  Integrales")
disp("8.  Operaciones con Vectores")
disp("9.  Vectores Unitario y Factor de Forma")
disp("10. Elemento de Volumen")
disp("11. Divergencia")
disp("12. Rotacional")
disp("13. Teorema de Green")
disp("14. Teorema de Gauss")
disp("15. Teorema de Stokes")
disp("16. Números Complejos")
disp("17. Ecuaciones Diferenciales Separables")
disp("18. Ecuaciones Diferenciales por Factor Integrantes")
disp("19. Ecuaciones Diferenciales Homogéneas de Orden Superior")
disp("20. Ecuaciones Diferenciales No Homogéneas de Segundo Orden")
disp("21. Método de Euler")
disp("22. Ecuaciones Difereciales por Variación de Parámetros")
disp("23. Ecuaciones Diferenciales de Cauchy Euler")
disp("24. Ecuaciones Diferenciales por Variación de Parámetros + Cauchy Euler")
disp("25. Ecuaciones Diferenciales por Reducción de Orden")
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
    case 9
        VectorUnitarioFactorForma();
    case 10
        ElementoDeVolumen();
    case 11
        Divergencia();
    case 12
        Rotacional();
    case 13
        TeoremaDeGreen();
    case 14
        TeoremaDeGauss();
    case 15
        TeoremaDeStokes();
    case 16
        NumerosComplejos();
    case 17
        EcuDifSeparables();
    case 18
        EcDifFactIntegrante();
    case 19
        EcDifHomoOrdSup();
    case 20
        EcDifNoHomoOrd2();
    case 21
        MetodoDeEuler();
    case 22
        EcDifVariacionParametros();
    case 23
        EcDifCauchyEuler();
    case 24
        EcDifVariacionParametros();
    case 25
        EcDifReducOrden();
    otherwise
        disp("Opción Inválida");
end