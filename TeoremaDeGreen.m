function TeoremaDeGreen()
    syms x y;
    disp("El teorema de Green establece que:")
    disp("La integral de (Mdx + Ndy) = Integral Doble de (Dn/Dx - Dm/Dy)Da")
    disp(" ")
    disp("Identificar el valor de M y N:")
    M= input("Ingrese el valor de M: ");
    N= input("Ingrese el valor de N: ");
    disp(" ")
    DNX= diff(N,x);
    DMY= diff(M,y);
    disp("Dn/Dx= " + string(DNX));
    disp("Dm/Dy= " + string(DMY));
    resta= DNX-DMY;
    disp(" ")
    disp("Dn/Dx - Dm/Dy = " + string(resta))
    disp("Integral doble de " + string(resta) + "dA")
    disp(" ")
    disp("¿Cómo desea resolver esta integral?")
    disp("1. Coordenadas Rectangulares")
    disp("2. Coordenadas Polares")
    disp("3. No resolver")
    disp(" ")
    opcion= input("Ingrese el número de su opción: ");
    if(opcion==1)
        ecuacion= resta;
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
        ecuacion= resta;
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