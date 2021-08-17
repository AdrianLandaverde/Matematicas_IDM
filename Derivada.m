function Derivada()
    disp("¿Qué tipo de Derivada desea hacer?")
    disp("1. Derivadas simples")
    disp("2. Derivadas pariales (x,y)")
    disp("3. Derivadas pariales (x,y,z)")
    disp(" ")
    while true
        opcion= input("Ingrese el número de la opción: ");
        if(opcion==1)
            DerivadaSimple();
            break
        elseif(opcion==2)
            DerivadaParcialXY();
            break
        elseif(opcion==3)
            DerivadaParcialXYZ();
            break
        else
            disp("Opción Inválida")
            disp(" ")
        end  
    end
end

function DerivadaSimple()
    syms x;
    disp(" ")
    strEcuacion= input("Ingrese la ecuación: y(x)= ", 's' );
    ecuacion= str2sym(strEcuacion);
    derivada= diff(ecuacion,x);
    disp(" ")
    disp("dy/dx= " + string(derivada))
end

function DerivadaParcialXY()
    syms x y;
    disp(" ")
    strEcuacion= input("Ingrese la ecuación: f(x,y)= ", 's' );
    ecuacion= str2sym(strEcuacion);
    disp(" ")
    strVar= input("Ingrese la primera variable a derivar (x/y): ", 's' );
    var= str2sym(strVar);
    derivada= diff(ecuacion,var);
    disp(" ")
    disp("f'(x,y)= " + string(derivada))
    disp(" ")
    strVar= input("Ingrese la segunda variable a derivar (x/y): ", 's' );
    var= str2sym(strVar);
    derivada= diff(derivada,var);
    disp(" ")
    disp("f''(x,y)= " + string(derivada))
end

function DerivadaParcialXYZ()
    syms x y z;
    disp(" ")
    strEcuacion= input("Ingrese la ecuación: f(x,y,z)= ", 's' );
    ecuacion= str2sym(strEcuacion);
    disp(" ")
    strVar= input("Ingrese la primera variable a derivar (x/y/z): ", 's' );
    var= str2sym(strVar);
    derivada= diff(ecuacion,var);
    disp(" ")
    disp("f'(x,y,z)= " + string(derivada))
    disp(" ")
    strVar= input("Ingrese la segunda variable a derivar (x/y/z): ", 's' );
    var= str2sym(strVar);
    derivada= diff(derivada,var);
    disp(" ")
    disp("f''(x,y,z)= " + string(derivada))
    disp(" ")
    strVar= input("Ingrese la tercera variable a derivar (x/y/z): ", 's' );
    var= str2sym(strVar);
    derivada= diff(derivada,var);
    disp(" ")
    disp("f'''(x,y,z)= " + string(derivada))
end