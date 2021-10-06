function EcDifHomoOrdSup
    disp("¿De qué orden es la ecuación?")
    disp("1. Segundo Orden")
    disp("2. Tercer Orden")
    disp("3. Cuarto Orden")
    disp("4. Quinto Orden")
    disp("5. Sexto Orden")
    disp(" ")
    opcion= input("Ingrese el número de la opcion: ");
    disp(" ")
    switch(opcion)
        case 1
            SegundoOrden();
        case 2
            TecerOrden();
        case 3
            CuartoOrden();
        case 4
            QuintoOrden();
        case 5
            SextoOrden();
        otherwise
            disp("Opción Inválida")
    end
end

function SegundoOrden()
    A= input("Coeficiente de y'' (a): ");
    B= input("Coeficiente de y' (b): ");
    C= input("Coeficiente de y (c): ");

    Determinante=B^2-4*A*C;
    disp(" ")
    disp("Determinante= b^2 - 4*a*c")
    disp("Determinante= " +string(B) + "^2 - 4*" + string(A) + "*" + string(C));
    disp("Determinante= " + string(Determinante))
    syms c1 m1 x c2 m2 a b;
    if(Determinante>0)
        disp("Tipo de raíces: Raíces Distinntas");
        y= c1*exp(m1*x)+c2*exp(m2*x);
    end
    if(Determinante==0)
        disp("Tipo de raíces: Raíces Iguales");
        y= c1*exp(m1*x)+c2*x*exp(m2*x);
    end
    if(Determinante<0)
        disp("Tipo de raíces: Raíces Imaginarias Conjugadas");
        y= c1*exp((a+b)*x)+c2*x*exp((a-b)*x);
    end

    % Raíces
    M=roots([A B C]);
    disp(" ")
    disp("M1 = (-" + string(B) + " + sqrt(" + string(Determinante) + ") )/(2*" +string(A) +")")
    disp("M1 = " + string(sym(M(1))))
    disp(" ")
    disp("M2 = (-" + string(B) + " - sqrt(" + string(Determinante) + ") )/(2*" +string(A) +")")
    disp("M2 = " + string(sym(M(2))))
    disp(" ")

    % Resolver y
    if(Determinante>=0)
        disp("y= "+ string(y));
        y=subs(y,[m1,m2],[M(1),M(2)]);
        disp("y= "+ string(y));
    else
        disp("y= "+ string(y));
        ai= real(M(1));
        bi= imag(M(1));
        y=subs(y,[a,b],[ai,bi]);
        disp("y= "+ string(y));
        y=exp(a*x)*(c1*cos(b*x)+c2*sin(b*x));
        y=subs(y,[a,b],[ai,bi]);
        disp("y= "+ string(y));
    end
end

function TecerOrden()
    syms m c1 c2 c3 x
    a= input("Ingrese el coeficiente de y''': ");
    b= input("Ingrese el coeficiente de y'': ");
    c= input("Ingrese el coeficiente de y': ");
    d= input("Ingrese el coeficiente de y: ");
    polinomio= a*m^3+b*m^2+c*m+d;
    factorizacion= factor(polinomio);
    s=size(factorizacion);
    if(s(2)<2)
        factorizacion(2)=1;
    end
    if(s(2)<3)
        factorizacion(3)=1;
    end
    disp(" ")
    disp("Polinomio: " + string(polinomio))
    disp("Factorización: (" +string(factorizacion(1))+")(" +string(factorizacion(2))...
        +")("+string(factorizacion(3))+")" )
    raices= roots([a,b,c,d]);
    raices= sym(round(raices,3));
    disp(" ")
    disp("m1= " + string(raices(1)))
    disp("m2= " + string(raices(2)))
    disp("m3= " + string(raices(3)))
    disp(" ")
    disp("y= c1*exp(m1*x) + c2*exp(m2*x) + c3*exp(m3*x)")
    disp("y= c1*exp("+string(raices(1))+"*x) + c2*exp("+string(raices(2))+"*x) + c3*exp("+string(raices(3))+"*x)")  
end

function CuartoOrden()
    syms m c1 c2 c3 c4 x
    a= input("Ingrese el coeficiente de y'''': ");
    b= input("Ingrese el coeficiente de y''': ");
    c= input("Ingrese el coeficiente de y'': ");
    d= input("Ingrese el coeficiente de y': ");
    e= input("Ingrese el coeficiente de y:");
    polinomio= a*m^4+b*m^3+c*m^2+d*m+e;
    factorizacion= factor(polinomio);
    s=size(factorizacion);
    if(s(2)<2)
        factorizacion(2)=1;
    end
    if(s(2)<3)
        factorizacion(3)=1;
    end
    if(s(2)<4)
        factorizacion(4)=1;
    end
    disp(" ")
    disp("Polinomio: " + string(polinomio))
    disp("Factorización: (" +string(factorizacion(1))+")(" +string(factorizacion(2))...
        +")("+string(factorizacion(3))+")("+string(factorizacion(4))+")")
    raices= roots([a,b,c,d,e]);
    raices= sym(round(raices,3));
    disp(" ")
    disp("m1= " + string(raices(1)))
    disp("m2= " + string(raices(2)))
    disp("m3= " + string(raices(3)))
    disp("m4= " + string(raices(4)))
    disp(" ")
    disp("y= c1*exp(m1*x) + c2*exp(m2*x) + c3*exp(m3*x) + c4*exp(m4*x)")
    disp("y= c1*exp("+string(raices(1))+"*x) + c2*exp("+string(raices(2))+ ...
        "*x) + c3*exp("+string(raices(3))+"*x) + c4*exp(" + string(raices(4))+"*x)")  
end

function QuintoOrden()
    syms m c1 c2 c3 c4 c5 x
    a= input("Ingrese el coeficiente de y''''': ");
    b= input("Ingrese el coeficiente de y'''': ");
    c= input("Ingrese el coeficiente de y''': ");
    d= input("Ingrese el coeficiente de y'': ");
    e= input("Ingrese el coeficiente de y':");
    f= input("Ingrese el coeficiente de y:");
    polinomio= a*m^5+b*m^4+c*m^3+d*m^2+e*m+f;
    factorizacion= factor(polinomio);
    s=size(factorizacion);
    if(s(2)<2)
        factorizacion(2)=1;
    end
    if(s(2)<3)
        factorizacion(3)=1;
    end
    if(s(2)<4)
        factorizacion(4)=1;
    end
    if(s(2)<5)
        factorizacion(5)=1;
    end
    disp(" ")
    disp("Polinomio: " + string(polinomio))
    disp("Factorización: (" +string(factorizacion(1))+")(" +string(factorizacion(2))...
        +")("+string(factorizacion(3))+")("+string(factorizacion(4))+")("+ ...
        string(factorizacion(5))+")")
    raices= roots([a,b,c,d,e,f]);
    raices= sym(round(raices,3));
    disp(" ")
    disp("m1= " + string(raices(1)))
    disp("m2= " + string(raices(2)))
    disp("m3= " + string(raices(3)))
    disp("m4= " + string(raices(4)))
    disp("m5= " + string(raices(5)))
    disp(" ")
    disp("y= c1*exp(m1*x) + c2*exp(m2*x) + c3*exp(m3*x) + c4*exp(m4*x)")
    disp("y= c1*exp("+string(raices(1))+"*x) + c2*exp("+string(raices(2))+ ...
        "*x) + c3*exp("+string(raices(3))+"*x) + c4*exp(" + string(raices(4))+ ...
        "*x) + c5*exp("+string(raices(5))+"*x)")  
end

function SextoOrden()
    syms m c1 c2 c3 c4 c5 x
    a= input("Ingrese el coeficiente de y'''''': ");
    b= input("Ingrese el coeficiente de y''''': ");
    c= input("Ingrese el coeficiente de y'''': ");
    d= input("Ingrese el coeficiente de y''': ");
    e= input("Ingrese el coeficiente de y'':");
    f= input("Ingrese el coeficiente de y':");
    g= input("Ingrese el coeficiente de y:");
    polinomio= a*m^6+b*m^5+c*m^4+d*m^3+e*m^2+f*m+g;
    factorizacion= factor(polinomio);
    s=size(factorizacion);
    if(s(2)<2)
        factorizacion(2)=1;
    end
    if(s(2)<3)
        factorizacion(3)=1;
    end
    if(s(2)<4)
        factorizacion(4)=1;
    end
    if(s(2)<5)
        factorizacion(5)=1;
    end
    if(s(2)<6)
        factorizacion(6)=1;
    end
    disp(" ")
    disp("Polinomio: " + string(polinomio))
    disp("Factorización: (" +string(factorizacion(1))+")(" +string(factorizacion(2))...
        +")("+string(factorizacion(3))+")("+string(factorizacion(4))+")("+ ...
        string(factorizacion(5))+")("+string(factorizacion(6))+")")
    raices= roots([a,b,c,d,e,f,g]);
    raices= sym(round(raices,3));
    disp(" ")
    disp("m1= " + string(raices(1)))
    disp("m2= " + string(raices(2)))
    disp("m3= " + string(raices(3)))
    disp("m4= " + string(raices(4)))
    disp("m5= " + string(raices(5)))
    disp("m6= " + string(raices(6)))
    disp(" ")
    disp("y= c1*exp(m1*x) + c2*exp(m2*x) + c3*exp(m3*x) + c4*exp(m4*x)")
    disp("y= c1*exp("+string(raices(1))+"*x) + c2*exp("+string(raices(2))+ ...
        "*x) + c3*exp("+string(raices(3))+"*x) + c4*exp(" + string(raices(4))+ ...
        "*x) + c5*exp("+string(raices(5))+"*x) + c6*exp(" + string(raices(6))+ "*x)")  
end