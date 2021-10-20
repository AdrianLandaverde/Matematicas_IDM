function EcDifVarParCauchyEuler()
    syms x y y1 y2 r C1 C2
    disp("Se tiene una ecuación de la forma x^2*y2 + x*y1 + y = f(x)")
    funcion= input("Ingrese el lado izquierdo de la ecuación= ");
    fx= input("Ingrese el lado derecho de la ecuación= ");
    disp(" ")
    fx=fx/subs(funcion,[y2, y1,y],[1,0,0]);
    disp("f(x) = " + string(fx))
    disp("y= x^r  ;  y1= r*x^(r-1)  ;  y2= r*(r-1)*x^(r-2)")
    funcion= subs(funcion,[y, y1, y2], [x^r, r*x^(r-1), r*(r-1)*x^(r-2)]);
    factores= factor(funcion);
    if(length(factores)==3)
    disp("("+string(factores(1))+")*("+string(factores(2))+")*("+string(factores(3))+") = 0")
    multiplicacion= factores(2)*factores(3);
    disp(string(multiplicacion)+ " = 0");
    else
        disp("("+string(factores(1))+")*("+string(factores(2))+") = 0")
        multiplicacion= factores(2);
        disp(string(multiplicacion)+ " = 0");
    end
    disp(" ")
    soluciones= solve(multiplicacion==0);
    disp("r1= " + string(soluciones(1)))
    disp("r2= " + string(soluciones(2)))
    disp(" ")
    if(soluciones(1)==soluciones(2))
        disp("y= C1*x^("+string(soluciones(1))+") + C2*x^(" + string(soluciones(2))+")*lnx")
        y1= x^(soluciones(1));
        y2= log(x)*x^(soluciones(2));
        y= C1*x^(soluciones(1))+ log(x)*C2*x^(soluciones(2));
    else
        disp("y= C1*x^("+string(soluciones(1))+") + C2*x^(" + string(soluciones(2))+")")
        y1= x^(soluciones(1));
        y2= x^(soluciones(2));
        y= C1*x^(soluciones(1))+ C2*x^(soluciones(2));
    end
    
    disp(" ")
    disp("y1= " + string(y1))
    disp("y2= " + string(y2))
    disp(" ")
    y1d= diff(y1,x);
    y2d= diff(y2,x);
    disp("y1'= "+string(y1d));
    disp("y2'= "+string(y2d));
    disp(" ")
    disp("W= ("+string(y1)+")*("+string(y2d)+") - ("+string(y2)+")*("+string(y1d)+")")
    W= y1*y2d-y2*y1d;
    disp("W= "+string(W));
    W=simplify(W);
    disp("W= "+string(W));
    disp(" ")
    
    
    u1= (y2*fx)/W;
    disp("u1= - Integral de (y2*f(x))/W")
    disp("u1= - Integral de ("+ string(y2)+"*"+string(fx)+")/"+string(W));
    disp("u1= - Integral de " + string(u1));
    u1=-int(u1,x);
    disp("u1= " + string(u1));
    disp(" ")
    
    u2= (y1*fx)/W;
    disp("u1= Integral de (y1*f(x))/W")
    disp("u1= Integral de ("+ string(y1)+"*"+string(fx)+")/"+string(W));
    disp("u1= Integral de " + string(u2));
    u2=int(u2,x);
    disp("u2= " + string(u2));
    disp(" ")
    disp("yp= u1*y1 + u2*y2")
    disp("yp= ("+string(u1)+")*(" +string(y1) + ") + (" + string(u2)+")*("+string(y2)+")")
    y1=y1*u1;
    y2= y2*u2;
    yp= y1+y2;
    disp("yp= " + string(y1) +" + " + string(y2))
    disp(" ");
    disp("y= " + string(y) + " + " + string(yp))
    ys= simplify(yp+y);
    disp("y= "+string(ys))
end