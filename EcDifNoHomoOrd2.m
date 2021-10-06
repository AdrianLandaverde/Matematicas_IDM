function EcDifNoHomoOrd2()
    disp("Se tiene una ecuación de la forma: Ay'' + By' + Cy = f(x)")
    opcion= input("Ingrese el número de términos de f(x): ");
    disp(" ")
    switch(opcion)
        case 1
            Termino1();
        case 2
            Termino2();
        case 3
            Termino3();
        case 4
            Termino4();
        otherwise
            disp("Número de términos no disponible")
    end
end

function Termino1()
    syms x A
    a= input("Coeficiente de y'' (a): ");
    b= input("Coeficiente de y' (b): ");
    c= input("Coeficiente de y (c): ");
    ygh= YHomogenea(a,b,c);
    disp(" ")
    disp("Si uno de los términos de f(x) es constante, que sea el último en ser ingresado")
    termino1= input("Ingrese el primer término de f(x): ");
    lA= ((termino1)/(coeffs(termino1)))*A;
    
    yParticular=lA;
    yParticular1=diff(yParticular,x);
    yParticular2=diff(yParticular1,x);
    disp(" ")
    disp("yp= " + string(yParticular));
    disp("yp'= " + string(yParticular1));
    disp("yp''= " + string(yParticular2));
    disp(" ")
    
    disp(string(a*yParticular2) + " + " + string(b*yParticular) + " + " + ...
        string(c*yParticular) + " = " + string(termino1))
    
    funcion1= a*yParticular2+b*yParticular1+c*yParticular;
    disp(string(funcion1) + " = " + string(termino1))
    funcion1= subs(funcion1,A,1);
    varA= termino1/funcion1;
    yp= subs(yParticular,A,1)*varA;
    disp("yp= " + string(yp))
    disp(" ")
    disp("y= ygh + yp")
    disp("y= " + string(ygh) + " + " +string(yp))
end

function Termino2()
    syms x A B
    a= input("Coeficiente de y'' (a): ");
    b= input("Coeficiente de y' (b): ");
    c= input("Coeficiente de y (c): ");
    ygh= YHomogenea(a,b,c);
    disp(" ")
    disp("Si uno de los términos de f(x) es constante, que sea el último en ser ingresado")
    termino1= input("Ingrese el primer término de f(x): ");
    lA= input("Ingrese el primer término de f(x) (Sustituir el coeficiente por A): ");
    termino2= input("Ingrese el segundo término de f(x): ");
    lB= input("Ingrese el segundo término de f(x) (Sustituir el coeficiente por B): ");
    
    yParticular=lA+lB;
    yParticular1=diff(yParticular,x);
    yParticular2=diff(yParticular1,x);
    disp(" ")
    disp("yp= " + string(yParticular));
    disp("yp'= " + string(yParticular1));
    disp("yp''= " + string(yParticular2));
    
    disp(string(a*yParticular2) + " + " + string(b*yParticular) + " + " + ...
        string(c*yParticular) + " = " + string(termino1))
    
    funcion1= a*yParticular2+b*yParticular1+c*yParticular;
    disp(string(funcion1) + " = " + string(termino1+termino2))
    
    terminoA= subs(lA/coeffs(lA),A,1);
    terminoB= subs(lB/coeffs(lB),B,1);
    
    ecuacion2= subs(funcion1,[terminoA,terminoB],[0,1]);
    ecuacion1= funcion1-(ecuacion2*terminoB);
    ecuacion1= simplify(subs(ecuacion1,terminoA,1));
    
    resultado1= subs(termino1/lA,A,1);
    resultado2= subs(termino2/lB,B,1);
    
    disp(string(ecuacion1) + " = " + string(resultado1))
    disp(string(ecuacion2) + " = " + string(resultado2))
    
    renglon1= [subs(ecuacion1,[A,B],[1,0]), subs(ecuacion1,[A,B],[0,1])];
    renglon2= [subs(ecuacion2,[A,B],[1,0]), subs(ecuacion2,[A,B],[0,1])];
    
    constantes=[resultado1; resultado2];
    variables=[renglon1; renglon2];
    raices= variables\constantes;
    disp(" ")
    disp("A= " + string(raices(1)))
    disp("B= " + string(raices(2)))
    disp(" ")
    yParticular= subs(yParticular,[A,B],[raices(1),raices(2)]);
    disp("yp= " + string(yParticular));
    
    disp(" ")
    disp("y= ygh + yp")
    disp("y= " + string(ygh) + " + " +string(yParticular))
    
end

function Termino3()
    syms x A B C
    a= input("Coeficiente de y'' (a): ");
    b= input("Coeficiente de y' (b): ");
    c= input("Coeficiente de y (c): ");
    ygh= YHomogenea(a,b,c);
    disp(" ")
    disp("Si uno de los términos de f(x) es constante, que sea el último en ser ingresado")
    termino1= input("Ingrese el primer término de f(x): ");
    lA= input("Ingrese el primer término de f(x) (Sustituir el coeficiente por A): ");
    termino2= input("Ingrese el segundo término de f(x): ");
    lB= input("Ingrese el segundo término de f(x) (Sustituir el coeficiente por B): ");
    termino3= input("Ingrese el tercer término de f(x): ");
    lC= input("Ingrese el tercer término de f(x) (Sustituir el coeficiente por C): ");
    
    yParticular=lA+lB+lC;
    yParticular1=diff(yParticular,x);
    yParticular2=diff(yParticular1,x);
    disp(" ")
    disp("yp= " + string(yParticular));
    disp("yp'= " + string(yParticular1));
    disp("yp''= " + string(yParticular2));
    
    disp(string(a*yParticular2) + " + " + string(b*yParticular1) + " + " + ...
        string(c*yParticular) + " = " + string(termino1+termino2+termino3))
    
    funcion1= a*yParticular2+b*yParticular1+c*yParticular;
    disp(string(funcion1) + " = " + string(termino1+termino2+termino3))
    disp(" ")
    terminoA= subs(lA/coeffs(lA),A,1);
    terminoB= subs(lB/coeffs(lB),B,1);
    terminoC= subs(lC/coeffs(lC),C,1);
    
    ecuacion3= subs(funcion1,[terminoA,terminoB,terminoC],[0,0,1]);
    ecuacion2= funcion1-ecuacion3*terminoC;
    ecuacion2= simplify(subs(ecuacion2,[terminoA,terminoB],[0,1]));
    ecuacion1= funcion1-ecuacion3*terminoC-ecuacion2*terminoB;
    ecuacion1= simplify(subs(ecuacion1,terminoA,1));
    
    resultado1= subs(termino1/lA,A,1);
    resultado2= subs(termino2/lB,B,1);
    resultado3= subs(termino3/lC,C,1);
    
    disp(string(ecuacion1) + " = " + string(resultado1))
    disp(string(ecuacion2) + " = " + string(resultado2))
    disp(string(ecuacion3) + " = " + string(resultado3))
    
    renglon1= [subs(ecuacion1,[A,B,C],[1,0,0]), subs(ecuacion1,[A,B,C],[0,1,0]), subs(ecuacion1,[A,B,C],[0,0,1])];
    renglon2= [subs(ecuacion2,[A,B,C],[1,0,0]), subs(ecuacion2,[A,B,C],[0,1,0]), subs(ecuacion2,[A,B,C],[0,0,1])];
    renglon3= [subs(ecuacion3,[A,B,C],[1,0,0]), subs(ecuacion3,[A,B,C],[0,1,0]), subs(ecuacion3,[A,B,C],[0,0,1])];
    
    constantes=[resultado1; resultado2; resultado3];
    variables=[renglon1; renglon2; renglon3];
    raices= variables\constantes;
    disp(" ")
    disp("A= " + string(raices(1)))
    disp("B= " + string(raices(2)))
    disp("C= " + string(raices(3)))
    disp(" ")
    yParticular= subs(yParticular,[A,B,C],[raices(1),raices(2),raices(3)]);
    disp("yp= " + string(yParticular));
    
    disp(" ")
    disp("y= ygh + yp")
    disp("y= " + string(ygh) + " + " +string(yParticular))
    
end

function Termino4()
    syms x A B C D
    a= input("Coeficiente de y'' (a): ");
    b= input("Coeficiente de y' (b): ");
    c= input("Coeficiente de y (c): ");
    ygh= YHomogenea(a,b,c);
    disp(" ")
    disp("Si uno de los términos de f(x) es constante, que sea el último en ser ingresado")
    termino1= input("Ingrese el primer término de f(x): ");
    lA= input("Ingrese el primer término de f(x) (Sustituir el coeficiente por A): ");
    termino2= input("Ingrese el segundo término de f(x): ");
    lB= input("Ingrese el segundo término de f(x) (Sustituir el coeficiente por B): ");
    termino3= input("Ingrese el tercer término de f(x): ");
    lC= input("Ingrese el tercer término de f(x) (Sustituir el coeficiente por C): ");
    termino4= input("Ingrese el cuarto término de f(x): ");
    lD= input("Ingrese el cuarto término de f(x) (Sustituir el coeficiente por D): ");
    
    yParticular=lA+lB+lC+lD;
    yParticular1=diff(yParticular,x);
    yParticular2=diff(yParticular1,x);
    disp(" ")
    disp("yp= " + string(yParticular));
    disp("yp'= " + string(yParticular1));
    disp("yp''= " + string(yParticular2));
    
    disp(string(a*yParticular2) + " + " + string(b*yParticular1) + " + " + ...
        string(c*yParticular) + " = " + string(termino1+termino2+termino3))
    
    funcion1= a*yParticular2+b*yParticular1+c*yParticular;
    disp(string(funcion1) + " = " + string(termino1+termino2+termino3))
    disp(" ")
    terminoA= subs(lA/coeffs(lA),A,1);
    terminoB= subs(lB/coeffs(lB),B,1);
    terminoC= subs(lC/coeffs(lC),C,1);
    terminoD= subs(lD/coeffs(lD),D,1);
    
    ecuacion4= subs(funcion1,[terminoA,terminoB,terminoC,terminoD],[0,0,0,1]);
    ecuacion3= funcion1-ecuacion4*terminoD;
    ecuacion3= simplify(subs(ecuacion3,[terminoA,terminoB,terminoC],[0,0,1]));
    ecuacion2= funcion1-ecuacion3*terminoC;
    ecuacion2= simplify(subs(ecuacion2,[terminoA,terminoB],[0,1]));
    ecuacion1= funcion1-ecuacion3*terminoC-ecuacion2*terminoB;
    ecuacion1= simplify(subs(ecuacion1,terminoA,1));
    
    resultado1= subs(termino1/lA,A,1);
    resultado2= subs(termino2/lB,B,1);
    resultado3= subs(termino3/lC,C,1);
    resultado4= subs(termino4/lD,D,1);
    
    disp(string(ecuacion1) + " = " + string(resultado1))
    disp(string(ecuacion2) + " = " + string(resultado2))
    disp(string(ecuacion3) + " = " + string(resultado3))
    disp(string(ecuacion4) + " = " + string(resultado4))
    
    renglon1= [subs(ecuacion1,[A,B,C,D],[1,0,0,0]), subs(ecuacion1,[A,B,C,D],[0,1,0,0]), ...
        subs(ecuacion1,[A,B,C,D],[0,0,1,0]), subs(ecuacion1,[A,B,C,D],[0,0,0,1])];
    renglon2= [subs(ecuacion2,[A,B,C,D],[1,0,0,0]), subs(ecuacion2,[A,B,C,D],[0,1,0,0]), ...
        subs(ecuacion2,[A,B,C,D],[0,0,1,0]), subs(ecuacion2,[A,B,C,D],[0,0,0,1])];
    renglon3= [subs(ecuacion3,[A,B,C,D],[1,0,0,0]), subs(ecuacion3,[A,B,C,D],[0,1,0,0]), ...
        subs(ecuacion3,[A,B,C,D],[0,0,1,0]), subs(ecuacion3,[A,B,C,D],[0,0,0,1])];
    renglon4= [subs(ecuacion4,[A,B,C,D],[1,0,0,0]), subs(ecuacion4,[A,B,C,D],[0,1,0,0]), ...
        subs(ecuacion4,[A,B,C,D],[0,0,1,0]), subs(ecuacion4,[A,B,C,D],[0,0,0,1])];
    
    
    constantes=[resultado1; resultado2; resultado3; resultado4];
    variables=[renglon1; renglon2; renglon3; renglon4];
    raices= variables\constantes;
    disp(" ")
    disp("A= " + string(raices(1)))
    disp("B= " + string(raices(2)))
    disp("C= " + string(raices(3)))
    disp("D= " + string(raices(4)))
    disp(" ")
    yParticular= subs(yParticular,[A,B,C,D],[raices(1),raices(2),raices(3),raices(4)]);
    disp("yp= " + string(yParticular));
    
    disp(" ")
    disp("y= ygh + yp")
    disp("y= " + string(ygh) + " + " +string(yParticular))
    
end

function YGH= YHomogenea(A,B,C) 
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
        disp("ygh= "+ string(y));
        y=subs(y,[m1,m2],[M(1),M(2)]);
        disp("ygh= "+ string(y));
    else
        disp("ygh= "+ string(y));
        ai= real(M(1));
        bi= imag(M(1));
        y=subs(y,[a,b],[ai,bi]);
        disp("ygh= "+ string(y));
        y=exp(a*x)*(c1*cos(b*x)+c2*sin(b*x));
        y=subs(y,[a,b],[ai,bi]);
        disp("ygh= "+ string(y));
    end
    YGH= y;
end