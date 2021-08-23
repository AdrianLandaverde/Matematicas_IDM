function Integral()
    disp("¿Qué tipo de Integral desea hacer?")
    disp("1. Integral simple")
    disp("2. Integral doble")
    disp("3. Integral triple")
    disp(" ")
    while true
        opcion= input("Ingrese el número de la opción: ");
        if(opcion==1)
            IntegralSimple();
            break
        elseif(opcion==2)
            IntegralDoble();
            break
        elseif(opcion==3)
            IntegralTriple();
            break
        else
            disp("Opción Inválida")
            disp(" ")
        end  
    end
end

function IntegralSimple()
    syms x;
    disp(" ")
    disp("¿Cómo desea resolver su integral?")
    disp("1. Integral Definida")
    disp("2. Integral Indefinida")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    disp(" ")
    
    if(opcion==1)
        strEcuacion= input("Ingrese la ecuación: f(x)= ", 's');
        ecuacion= str2sym(strEcuacion);
        strLimMin= input("Ingrese el límite inferior: ", 's');
        limMin= str2sym(strLimMin);
        strLimMax= input("Ingrese el límite superior: ", 's');
        limMax= str2sym(strLimMax);
        disp(" ")
        integral= int(ecuacion,x);
        disp("Integral= " + string(integral) + " Evaluada en x= " + string(limMax) + ", x= " + string(limMin))
        integralS=subs(integral,x,limMax);
        integralI=subs(integral,x,limMin);
        integral=integralS-integralI;
        disp("Integral= (" + string(integralS)+ ") - (" + string(integralI)+ ")")
        disp("Integral= " + string(integral))
    elseif(opcion==2)
        strEcuacion= input("Ingrese la ecuación: f(x)= ", 's');
        ecuacion= str2sym(strEcuacion);
        disp(" ")
        integral= int(ecuacion,x);
        disp("Integral= " + string(integral))
    end
end

function IntegralDoble()
    disp(" ")
    disp("¿En qué coordenadas desea hacer su integral?")
    disp("1. Coordenadas rectangulares")
    disp("2. Coordenadas polares")
    opcion= input("Ingrese el número de la opción: ");
    disp(" ")
    if (opcion==1)
        syms x y;
        strEcuacion= input("Ingrese la ecuación: f(x,y)= ", 's');
        ecuacion= str2sym(strEcuacion);
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
        disp("¿En qué coordenadas tiene sus datos?")
        disp("1. Coordenadas Polares")
        disp("2. Coordenadas Rectangulares")
        opcion= input("Ingrese el número de la opción: ");
        disp(" ")
        if(opcion==1)
            strEcuacion= input("Ingrese la ecuación: f(r,theta)= ", 's');
            ecuacion= str2sym(strEcuacion);
            disp(" ")
        elseif(opcion==2)
            strEcuacion= input("Ingrese la ecuación: f(x,y)= ", 's');
            ecuacion= str2sym(strEcuacion);
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
        end
        
        syms t theta;
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
    end      
end

function IntegralTriple()
    disp(" ")
    disp("¿En qué coordenadas desea hacer su integral?")
    disp("1. Coordenadas rectangulares")
    disp("2. Coordenadas cilíndricas")
    disp("3. Coordenadas esféricas")
    opcion= input("Ingrese el número de la opción: ");
    disp(" ")
    if (opcion==1)
        syms x y z;
        strEcuacion= input("Ingrese la ecuación: f(x,y,z)= ", 's');
        ecuacion= str2sym(strEcuacion);
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
        strEcuacion= input("Ingrese la ecuación: f(r,theta,z)= ", 's');
        ecuacion= str2sym(strEcuacion);
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
        strEcuacion= input("Ingrese la ecuación: f(p,theta,phi)= ", 's');
        ecuacion= str2sym(strEcuacion);
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