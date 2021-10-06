function MetodoDeEuler
    syms x y
    funcion=input("Ingrese la ecuacion: y'= ");
    x0= input("Ingrese el valor inicial de x: ");
    y0= input("Ingrese el valor inicial de y: ");
    h= input("Ingrese el valor de h: ");
    xf= input("Ingrese el valor final de x: ");
    yn=y0;
    xn=x0;
    for i= x0:h:xf
        disp("x= " + string(xn) + "  ;  yn= " + string(yn))
        yn1= double(yn+ h*(subs(funcion,[x,y],[xn,yn])));
        disp("yn+1= " + string(yn1))
        disp(" ")
        xn=xn+h;
        yn=yn1;
    end
end