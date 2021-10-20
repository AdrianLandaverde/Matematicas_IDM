function EcDifFactIntegrante
    syms x y C
    disp("Se tiene una ecuación de la forma dy/dx + P(x)y = Q(x)");
    coffA= input("Ingrese el coeficiente de dy/dx:");
    coffP= input("Ingrese el valor de (P(x)):");
    coffQ= input("Ingrese el valor de Q(x):");
    coffP=coffP/coffA;
    coffQ=coffQ/coffA;
    disp(" ")
    disp("dy/dx + (" + string(coffP) + ")*y = " + string(coffQ))
    disp(" ")
    disp("Se determina el factor de integración u(x)")
    disp("u(x)= e^(Integral de P(x))")
    disp("u(x)= e^(Integral de " +string(coffP)+ ")")
    ux=int(coffP,x);
    disp("u(x)= e^("+string(ux)+ ")")
    ux=exp(ux);
    ux=simplify(ux);
    disp("u(x)= " +string(ux))
    disp(" ")
    disp(string(ux)+ "*((dy/dx) + " + string(coffP) + "*y) = (" + string(ux)+")*("+string(coffQ)+")")
    coffQ=coffQ*ux;
    disp("(d/dx)*("+string(ux)+"*y) = " + string(coffQ))
    disp(" ")
    disp("Integral de (d/dx)*("+string(ux)+"y) = Integral de" + string(coffQ))
    coffQ= int(coffQ,x)+C;
    disp(string(ux) + "*y = " + string(coffQ));
    coffQ= coffQ/ux;
    disp("y= "+ string(coffQ))
end