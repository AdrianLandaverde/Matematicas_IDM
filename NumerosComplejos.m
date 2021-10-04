function NumerosComplejos()
    disp("¿Qué desa calcular?")
    disp("1. Operaciones con números complejos")
    disp("2. Módulo")
    disp("3. Raíces de números complejos")
    disp(" ")
    opcion= input("Ingrese el número de su opcion: ");
    switch(opcion)
        case 1
            OperacionesComplejas()
        case 2
            Modulo()
        case 3
            RaicesImaginarias()
        otherwise
            disp("Opción inválida")
    end
end

function OperacionesComplejas()
    ecuacion= input("Ingrese la ecuación a resolver: ");
    disp(ecuacion)
end

function Modulo()
    a= input("Ingrese la parte real de Z: ");
    b= input("Ingrese la parte imaginaria de Z (sin la i): ");
    mZ=(a^2+b^2);
    disp("||Z||= sqrt((" +string(a) +")^2 + (" + string(b) +")^2)")
    disp("||Z||= sqrt(" + string(mZ) +")")
    mZ=sqrt(mZ);
    disp("||Z||= " + string(sym(mZ))) 
end

function RaicesImaginarias
    n= input("¿Cuántas raíces desa calcular?: ");
    a= input("Ingrese la parte real de Z: ");
    b= input("Ingrese la parte imaginaria de Z (sin la i): ");
    disp("Fórmula= ||w||^(1/" +string(n)+")*exp((theta+2*k*pi)/n)")
    mW= sqrt(a^2+b^2);
    disp("||w||= sqrt((" +string(a) +")^2 + (" + string(b) +")^2)")
    disp("||w||= " + string(sym(mW)))            
    mW=sym(mW^(1/n));
    disp("||w||^(1/"+string(n)+")= "+ string(mW))
    disp(" ")
    angulo=input("Ingrese el ángulo: ");
    angulo= sym(angulo);
    disp(" ")
    for i= 0:(n-1)      
        disp("k"+string(i)+": (" + string(angulo) + " + 2*"+string(i)+"*pi)/"+string(n))
        ke=sym((angulo+2*i*pi))/n;
        disp("k"+string(i)+": " + string(ke));
        disp("k"+string(i)+": " + string(mW) + "*exp(" + string(ke)+")")
        disp("k"+string(i)+": " + string(mW) + "*(cos(" + string(ke) + ") + i*sin(" + string(ke)+"))")
        k= mW*(cos(ke)+1i*sin(ke));
        disp("k"+string(i)+": " + string(k))
        disp(" ")
        
    end
end