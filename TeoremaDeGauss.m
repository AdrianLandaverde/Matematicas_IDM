function TeoremaDeGauss()
    syms x y z;
    disp("El teorema de Gauss establece que:")
    disp("La integral doble de (F * ds) = Integral triple de (divergencia de F)Dv")
    disp(" ")
    disp("F= < M , N , P>")
    M= input("Ingrese el valor de M: ");
    N= input("Ingrese el valor de N: ");
    P= input("Ingrese el valor de P: ");
    disp(" ")
    disp("Gradiente de F= dM/dx + dN/dy + dP/dz")
    DMX= diff(M,x);
    DNY= diff(N,y);
    DPZ= diff(P,z);
    disp("dM/dx= " + string(DMX))
    disp("dN/dy= " + string(DNY))
    disp("dP/dz= " + string(DPZ))
    disp(" ")
    ecuacion= DMX+DNY+DPZ;
    disp("Integral Triple de: " + string(ecuacion) + " dv")
    disp(" ")
    disp("¿Cómo desea resolver esta integral?")
    disp("1. Coordenadas Rectangulares")
    disp("2. Coordenadas Cilíndricas")
    disp("3. Coordenadas Esféricas")
    disp("4. No resolver")
    disp(" ")
    opcion= input("Ingrese el número de su opción: ");
    if(opcion==1)
        disp(" ")
        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (x/y,z): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración Superior?: ",'s');
        limMax= str2sym(limMax);
        Integral= int(ecuacion,var);
        disp("Integral doble de " + string(Integral) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(Integral,var,limMax);
        IntegralI=subs(Integral,var,limMin);
        Integral= expand(int(ecuacion,var,limMin,limMax));
        disp("Integral doble de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral doble de: " + string(Integral))
        disp(" ")
        
        disp("SEGUNDA INTEGRAL")
        var= input("¿Segunda variable de integración? (x/y/z): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral de " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral simple de: (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral simple de: " + string(Integral))
        disp(" ")
        
        disp("TERCERA INTEGRAL")
        var= input("¿Tercdera variable de integración? (x/y/z): ",'s');
        var= str2sym(var);
        limMin= input("¿Limite de integración inferior?: ",'s');
        limMin= str2sym(limMin);
        limMax= input("¿Limite de integración superior?: ",'s');
        limMax= str2sym(limMax);
        disp("Integral= " + string(expand(int(Integral,var))) + " Evaluada en " + string(var) +"= " + string(limMax) + ", "+ string(var) +"= " + string(limMin))
        IntegralS=subs(int(Integral,var),var,limMax);
        IntegralI=subs(int(Integral,var),var,limMin);
        Integral= int(Integral,var,limMin,limMax);
        disp("Integral Triple= (" + string(IntegralS) + ") - (" + string(IntegralI) + ")")
        disp("Integral Triple= " + string(Integral))
        disp(" ")
    elseif(opcion==2)
        syms r theta z;
        disp("Equivalencias: ")
        disp("x^2 + y^2 = r^2")
        disp("y/x = tan(theta)")
        disp("x= r*cos(theta)")
        disp("y= r*sin(theta)")
        disp(" ")
        Cil= subs(ecuacion,(x^2+y^2),r^2);
        Cil= subs(Cil,(y/x),tan(theta));
        ecuacion= subs(Cil,[x,y],[r*cos(theta), r*sin(theta)]);
        disp("La ecuación en coordenadas cilíndricas es: " + string(ecuacion))
        disp("Integral Triple de " + string(ecuacion) + "dV")
        disp("Integral Triple de " + string(ecuacion) + "*r drdthetadz")
        ecuacion=ecuacion*r;
        disp(" ")
        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (r/theta/z): ",'s');
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
        var= input("¿Segunda variable de integración? (r/theta/z): ",'s');
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
        var= input("¿Tercera variable de integración? (r/theta/z): ",'s');
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
        disp(" ")
        
    elseif(opcion==3)
        syms p theta phi;
        disp("Equivalencias: ")
        disp("x= p*sin(phi)*cos(theta)")
        disp("y= p*sin(phi)*sin(theta)")
        disp("z= p*cos(phi)")
        disp(" ")
        ecuacion= subs(ecuacion,[x,y,z],[p*sin(phi)*cos(theta), p*sin(phi)*sin(theta),p*cos(phi) ]);
        disp("La ecuación en coordenadas esféricas es: " + string(ecuacion))
        disp("Integral Triple de " + string(ecuacion) + "dV")
        disp("Integral Triple de " + string(ecuacion) + "*p^2*sin(phi) dpdthetadphi")
        ecuacion=ecuacion*(p^2)*sin(phi);
        disp(" ")
        disp("PRIMERA INTEGRAL")
        var= input("¿Primera variable de integración? (p,theta,phi)): ",'s');
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
        var= input("¿Segunda variable de integración? (p,theta,phi): ",'s');
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
        var= input("¿Tercera variable de integración? (p,theta,phi): ",'s');
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
        disp(" ")
    end
    
end