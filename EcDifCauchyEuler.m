function EcDifCauchyEuler()
    syms x y y1 y2 r
    disp("Se tiene una ecuación de la forma x^2*y2 + x*y1 + y = 0")
    funcion= input("Ingrese la ecuación 0= ");
    disp(" ")
    disp("y= x^r  ;  y1= r*x^(r-1)  ;  y2= r*(r-1)*x^(r-2)")
    funcion= subs(funcion,[y, y1, y2], [x^r, r*x^(r-1), r*(r-1)*x^(r-2)]);
    factores= factor(funcion);
    if(length(factores)==3)
    disp("("+string(factores(1))+")*("+string(factores(2))+")*("+string(factores(3))+") = 0")
    multiplicacion= factores(2)*factores(3);
    disp(string(multiplicacion)+ " = 0");
    else
        disp("("+string(factores(1))+")*("+string(factores(2))+") = 0")
        multiplicacion= factores(2);
        disp(string(multiplicacion)+ " = 0");
    end
    disp(" ")
    soluciones= solve(multiplicacion==0);
    disp("r1= " + string(soluciones(1)))
    disp("r2= " + string(soluciones(2)))
    disp(" ")
    if(soluciones(1)==soluciones(2))
        disp("y= C1*x^("+string(soluciones(1))+") + C2*x^(" + string(soluciones(2))+")*lnx")
    else
        disp("y= C1*x^("+string(soluciones(1))+") + C2*x^(" + string(soluciones(2))+")")
    end
    
end