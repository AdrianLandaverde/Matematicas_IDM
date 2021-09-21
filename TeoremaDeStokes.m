function TeoremaDeStokes()
    syms x y z;
    disp("El teorema de Gauss establece que:")
    disp("La integral de (F * dr) = Integral doble de (rotacional de F)Ds")
    disp(" ")
    disp("F= { i , j , k }")
    I= input("Ingrese el valor de F en la coordenada i: ");
    J= input("Ingrese el valor de F en la coordenada j: ");
    K= input("Ingrese el valor de F en la coordenada k: ");
    disp(" ")
    disp("rotacional F= { (dk/dy - dj/dz) , -(dk/dx - di/dz) , (dj/dx - di/dy) }")
    disp("(dk/dy - dj/dz)= " + string(diff(K,y)) + " - " + string(diff(J,z)))
    disp("-(dk/dx - di/dz)= " + string(diff(K,x)) + " - " + string(diff(I,z)))
    disp("(dj/dx - di/dy))= " + string(diff(J,x)) + " - " + string(diff(I,y)))
    rotI= diff(K,y)-diff(J,z);
    rotJ= -(diff(K,x) -diff(I,z));
    rotK= diff(J,x) -diff(I,y);
    disp(" ")
    disp("Rotacional F= { " + string(rotI) + " , " + string(rotJ) + " , " + string(rotK) + " }")
    disp(" ")
    DSI= input("Componente i del vector normal (ds): ");
    DSJ= input("Componente j del vector normal (ds): ");
    DSK= input("Componente k del vector normal (ds): ");
    disp(" ")
    disp("Producto Punto de rotacional de F por ds:")
    disp("(" + string(rotI)+"*"+string(DSI)+") + (" + string(rotJ)+"*"+string(DSJ)+") + ("+ string(rotK)+"*"+string(DSK)+")")
    PPI=rotI*DSI;
    PPJ=rotJ*DSJ;
    PPK=rotK*DSK;
    disp(string(PPI)+" + "+string(PPJ)+" + " + string(PPK))
    Productopunto=PPI+PPJ+PPK;
    disp("Producto punto= " + string(Productopunto))
    disp(" ")
    disp("Doble integral de: " + string(Productopunto) + " dxdy")
    disp(" ")
    disp("¿Cómo desea resolver esta integral?")
    disp("1. Coordenadas Rectangulares")
    disp("2. Coordenadas Polares")
    disp("3. No resolver")
    disp(" ")
    opcion= input("Ingrese el número de su opción: ");
    if(opcion==1)
        ecuacion= Productopunto;
        disp(" ")
        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (x/y): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración Superior?: ",'s');
        limMax= str2sym(limMax);
        Integral= int(ecuacion,var);
        disp("Integral de " + string(Integral) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(Integral,var,limMax);
        IntegralI=subs(Integral,var,limMin);
        Integral= expand(int(ecuacion,var,limMin,limMax));
        disp("Integral simple de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral simple de: " + string(Integral))
        disp(" ")
        
        disp("SEGUNDA INTEGRAL")
        var= input("¿Segunda variable de integración? (x/y): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral= " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral doble= (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral doble= " + string(Integral))
        disp(" ")
    elseif(opcion==2)
        syms r theta
        ecuacion= Productopunto;
        disp(" ")
        disp("Equivalencias: ")
        disp("x^2 + y^2 = r^2")
        disp("y/x = tan(theta)")
        disp("x= r*cos(theta)")
        disp("y= r*sin(theta)")
        disp(" ")
        ecuacion= subs(ecuacion,(x^2+y^2),r^2);
        ecuacion= subs(ecuacion,(y/x),tan(theta));
        ecuacion= subs(ecuacion,[x,y],[r*cos(theta), r*sin(theta)]);
        disp("La ecuación en coordenadas polares es: " + string(ecuacion))
        disp(" ")
        disp("Integral Doble de " + string(ecuacion) + "dA")
        disp("Integral Doble de " + string(ecuacion) + "*r drdtheta")
        ecuacion=ecuacion*r;
        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (r/theta): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración Superior?: ",'s');
        limMax= str2sym(limMax);
        Integral= int(ecuacion,var);
        disp("Integral de " + string(Integral) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(Integral,var,limMax);
        IntegralI=subs(Integral,var,limMin);
        Integral= expand(IntegralS-IntegralI);
        disp("Integral simple de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral simple de: " + string(Integral))
        disp(" ")

        disp("SEGUNDA INTEGRAL")
        var= input("¿Segunda variable de integración? (r/theta): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral= " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral doble= (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral doble= " + string(Integral))
        disp(" ")
    else
        disp("Opción inválida")
    end
end