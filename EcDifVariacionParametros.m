function EcDifVariacionParametros()
    syms x
    A= input("Coeficiente de y'' (a): ");
    B= input("Coeficiente de y' (b): ");
    C= input("Coeficiente de y (c): ");
    fx= input("Valor de f(x): ");

    Determinante=B^2-4*A*C;
    disp(" ")
    disp("Determinante= b^2 - 4*a*c")
    disp("Determinante= " +string(B) + "^2 - 4*" + string(A) + "*" + string(C));
    disp("Determinante= " + string(Determinante))
    syms c1 m1 x c2 m2 a b;
    if(Determinante>0)
        disp("Tipo de raíces: Raíces Distinntas");
        y= c1*exp(m1*x)+c2*exp(m2*x);
        y1= c1*exp(m1*x);
        y2= c2*exp(m2*x);
    end
    if(Determinante==0)
        disp("Tipo de raíces: Raíces Iguales");
        y= c1*exp(m1*x)+c2*x*exp(m2*x);
        y1= c1*exp(m1*x);
        y2= c2*x*exp(m2*x);
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
        y1= subs(y1,[m1,c1],[M(1),1]);
        y2= subs(y2,[m2,c2],[M(2),1]);
        disp("y= "+ string(y));
    else
        disp("y= "+ string(y));
        ai= real(M(1));
        bi= imag(M(1));
        y=subs(y,[a,b],[ai,bi]);
        disp("y= "+ string(y));
        y=exp(a*x)*(c1*cos(b*x)+c2*sin(b*x));
        y=subs(y,[a,b],[ai,bi]);
        y1= exp(a*x)*(c1*cos(b*x));
        y2= exp(a*x)*(c2*sin(b*x));
        y1= subs(y1,[a,b,c1],[ai,bi,1]);
        y2= subs(y2,[a,b,c2],[ai,bi,1]);
        disp("y= "+ string(y));
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
end