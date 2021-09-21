function ElementoDeVolumen()
    disp("¿En qué coordendas desea calcular el elemento de volumen?")
    disp("1. Coordenadas Cilíndricas (r, theta, z)")
    disp("2. Coordenadas Esféricas (rho, theta, phi)")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    disp(" ")
    switch(opcion)
        case 1
            Cilindricas();
        case 2
            Esfericas();
    end
end

function Cilindricas()
    disp("dV= Hz*Hr*Htheta*Dz*Dr*Dtheta")
    disp("dV= r*Dz*Dr*Dtheta")
    disp(" ")
    opcion= input("¿Desea calcular el volumen (s / n)",'s');
    if(opcion=="s")
        disp(" ")
        syms r theta z;
        ecuacion= r*1;

        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (r,theta,z)): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración Superior?: ",'s');
        limMax= str2sym(limMax);
        Integral= int(ecuacion,var);
        disp("Integral doble de: " + string(Integral) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(Integral,var,limMax);
        IntegralI=subs(Integral,var,limMin);
        Integral= expand(IntegralS-IntegralI);
        disp("Integral doble de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral doble de: " + string(Integral))
        disp(" ")

        disp("SEGUNDA INTEGRAL")
        var= input("¿Segunda variable de integración? (r,theta,z): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral de: " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral simple de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral simple de: " + string(Integral))
        disp(" ")
        
        disp("TERCERA INTEGRAL")
        var= input("¿Tercera variable de integración? (r,theta,z): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral= " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral triple= (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral triple= " + string(Integral))      
    end
end

function Esfericas()
    disp("dV= Hrho*Htheta*Hphi*Drho*Dtheta*Dphi")
    disp("dV= rho^2*sen(phi)*Drho*Dtheta*Dphi")
    disp(" ")
    opcion= input("¿Desea calcular el volumen (s / n): ",'s');
    if(opcion=="s")
        disp(" ")
        syms rho theta phi;
        ecuacion= (rho^2)*sin(phi);

        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (rho,theta,phi): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración Superior?: ",'s');
        limMax= str2sym(limMax);
        Integral= int(ecuacion,var);
        disp("Integral doble de: " + string(Integral) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(Integral,var,limMax);
        IntegralI=subs(Integral,var,limMin);
        Integral= expand(IntegralS-IntegralI);
        disp("Integral doble de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral doble de: " + string(Integral))
        disp(" ")

        disp("SEGUNDA INTEGRAL")
        var= input("¿Segunda variable de integración? (rho,theta,phi): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral de: " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral simple de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral simple de: " + string(Integral))
        disp(" ")
        
        disp("TERCERA INTEGRAL")
        var= input("¿Tercera variable de integración? (rho,theta,phi): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral= " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral triple= (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral triple= " + string(Integral))      
    end
end