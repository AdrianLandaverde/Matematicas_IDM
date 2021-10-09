function EcDifReducOrden()
    disp("¿Qué pasa con la X en la ecuación?")
    disp("1. Sí aparece explícitamente la X en la ecuación")
    disp("2. No aparece explícitamente la X en la ecuación")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    disp(" ")
    switch(opcion)
        case 1
           aparece() ;
        case 2
            noaparece();
        otherwise
            disp("Opción inválida")
    end
end

function aparece()
    syms x z y y1 y2 dz dx C1 C2;
    disp("Para la ecuación, ingrese y' como y1, y'' como y2")
    izquierdo= input("Ingrese el lado izquierdo de la ecuación: ");
    derecho= input("Ingrese el lado derecho de la ecuación: ");
    disp(" ")
    disp("z= y1  ;  dz/dx= y2")
    izquierdo= subs(izquierdo,[y1, y2], [z, dz/dx]);
    derecho= subs(derecho,[y1, y2], [z, dz/dx]);
    disp(string(izquierdo) + " = " + string(derecho))
    disp(" ")
    disp("¿Cómo desea resolver la ecuación?")
    disp("*Este paso no está comprobado*")
    disp("1. Por Separación de Variables")
    disp("2. Por factor Integrante")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    switch(opcion)
        case 1
            disp("Se tiene una ecuación: dz + f(z)= f(x)+ dx")
            ladoy= input("Ingrese el lado izquierdo de la ecuación (Sólo z's): ");
            ladox= input("Ingrese el lado derecho de la ecuación (Sólo x's): ");
            disp(" ")
            disp("Ecuación Separada:")
            disp(string(ladoy) + " = " + string(ladox))
            disp(" ")
            disp("Integral de " + string(ladoy))
            ladoy= subs(ladoy,dz,1);
            ladoy=int(ladoy,z);
            disp("Integral= " + string(ladoy))
            disp(" ")
            disp("Integral de " + string(ladox))
            ladox= subs(ladox,dx,1);
            ladox=int(ladox,x)+C1;
            disp("Integral= " + string(ladox))
            disp(" ")
            disp("Solución: " + string(ladoy) + " = "+string(ladox))
            solucionSimp= solve(ladoy==ladox,z);
            disp(" ")
            disp("Solución Simplificada: z= " + string(solucionSimp))
            disp(" ")
            disp("dy/dx = z   ;   y= Integral de z")
            y= int(solucionSimp,x)+C2;
            disp("Integral de Z= " + string(y))
            disp("y= " + string(y))
        case 2
            disp("Se tiene una ecuación de la forma dz/dx + P(x)z = Q(x)");
            coffA= input("Ingrese el coeficiente de dz/dx:");
            coffP= input("Ingrese el valor de (P(x)):");
            coffQ= input("Ingrese el valor de Q(x):");
            coffP=coffP/coffA;
            coffQ=coffQ/coffA;
            disp(" ")
            disp("dz/dx + (" + string(coffP) + ")*z = " + string(coffQ))
            disp(" ")
            disp("Se determina el factor de integración u(x)")
            disp("u(x)= e^(Integral de P(x))")
            disp("u(x)= e^(Integral de " +string(coffP)+ ")")
            ux=int(coffP,x);
            disp("u(x)= e^("+string(ux)+ ")")
            ux=exp(ux);
            disp("u(x)= " +string(ux))
            disp(" ")
            disp(string(ux)+ "*((dz/dx) + " + string(coffP) + "*z) = (" + string(ux)+")*("+string(coffQ)+")")
            coffQ=coffQ*ux;
            disp("(d/dx)*("+string(ux)+"*z) = " + string(coffQ))
            disp(" ")
            disp("Integral de (d/dx)*("+string(ux)+"z) = Integral de" + string(coffQ))
            coffQ= int(coffQ,x)+C1;
            disp(string(ux) + "*z = " + string(coffQ));
            coffQ= coffQ/ux;
            disp("z= "+ string(coffQ))
            disp(" ")
            disp("dy/dx = z   ;   y= Integral de z")
            y= int(coffQ,x)+C2;
            disp("Integral de Z= " + string(y))
            disp("y= " + string(y))
    end
end

function noaparece()
    syms z y y1 y2 dz dy C1 C2 x dx;
    disp("Para la ecuación, ingrese y' como y1, y'' como y2")
    izquierdo= input("Ingrese el lado izquierdo de la ecuación: ");
    derecho= input("Ingrese el lado derecho de la ecuación: ");
    disp(" ")
    disp("z= y1  ;  (dz/dy)*z= y2")
    izquierdo= subs(izquierdo,[y1, y2], [z, (dz/dy)*z]);
    derecho= subs(derecho,[y1, y2], [z, (dz/dy)*z]);
    disp(string(izquierdo) + " = " + string(derecho))
    disp(" ")
    disp("¿Cómo desea resolver la ecuación?")
    disp("*Este paso no está comprobado*")
    disp("1. Por Separación de Variables")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    switch(opcion)
        case 1
            disp("Se tiene una ecuación: dz + f(z)= f(y)+ dy")
            ladoy= input("Ingrese el lado izquierdo de la ecuación (Sólo z's): ");
            ladox= input("Ingrese el lado derecho de la ecuación (Sólo y's): ");
            disp(" ")
            disp("Ecuación Separada:")
            disp(string(ladoy) + " = " + string(ladox))
            disp(" ")
            disp("Integral de " + string(ladoy))
            ladoy= subs(ladoy,dz,1);
            ladoy=int(ladoy,z);
            disp("Integral= " + string(ladoy))
            disp(" ")
            disp("Integral de " + string(ladox))
            ladox= subs(ladox,dy,1);
            ladox=int(ladox,y)+C1;
            disp("Integral= " + string(ladox))
            disp(" ")
            disp("Solución: " + string(ladoy) + " = "+string(ladox))
            solucionSimp= solve(ladoy==ladox,z);
            disp(" ")
            disp("Solución Simplificada: z= " + string(solucionSimp))
            solucionSimp= subs(solucionSimp,exp(C1),C1);
            disp("Solución Simplificada: z= " + string(solucionSimp))
            disp(" ")
            disp("dy/dx = z")
            disp("dy/dx= "+string(solucionSimp))
            izquierda2= input("Ingrese el lado izquierdo de la ecuación (sólo y's): ");
            izquierda2= subs(izquierda2,dy,1);
            derecha2= input("Ingrese el lado derecho de la ecuación (sólo x's): ");
            derecha2= subs(derecha2,dx,1);
            disp(string(izquierda2)+"*dy = " + string(derecha2)+"*dx")
            disp("Integral de " + string(izquierda2)+"*dy = Integral de " + string(derecha2)+"*dx")
            izquierda2= int(izquierda2,y);
            derecha2= int(derecha2,x)+C2;
            disp(string(izquierda2) + " = " + string(derecha2))
            solu= solve(izquierda2==derecha2,y);
            disp("Solución simplificada= " + string(solu))
    end
end