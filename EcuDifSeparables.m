function EcuDifSeparables()
    syms x y dx dy C
    disp("Se tiene una ecuación: dy + f(y)= f(x)+ dx")
    ladoy= input("Ingrese el lado izquierdo de la ecuación (Sólo y's): ");
    ladox= input("Ingrese el lado derecho de la ecuación (Sólo x's): ");
    disp(" ")
    disp("Ecuación Separada:")
    disp(string(ladoy) + " = " + string(ladox))
    disp(" ")
    disp("Integral de " + string(ladoy))
    ladoy= subs(ladoy,dy,1);
    ladoy=int(ladoy,y);
    disp("Integral= " + string(ladoy))
    disp(" ")
    disp("Integral de " + string(ladox))
    ladox= subs(ladox,dx,1);
    ladox=int(ladox,x)+C;
    disp("Integral= " + string(ladox))
    disp(" ")
    disp("Solución: " + string(ladoy) + " = "+string(ladox))
    solucionSimp= solve(ladoy==ladox,y);
    disp(" ")
    disp("Solución Simplificada: y= " + string(solucionSimp))
    solucionSimp= subs(solucionSimp,exp(C),C);
    disp("Solución Simplificada: z= " + string(solucionSimp))
end