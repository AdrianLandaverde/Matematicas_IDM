function gradiente= Gradiente()
    disp("¿Qué gradiente desea calcular?")
    disp("1. Gradiente de z(x,y)")
    disp("2. Gradiente de F(x,y,z)")
    while true
        opcion= input("Ingrese el número de la opción: ");
        if(opcion==1)
            gradiente= gradienteXY();
            break
        elseif(opcion==2)
            gradiente= gradienteXYZ();
            break
        else
            disp("Opción Inválida")
            disp(" ")
        end
        
    end
end
function gradiente= gradienteXY()
    syms x y;
    strFuncion= input("Ingrese la ecuación: z(x,y) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strX0= input("Ingrese el valor de Xo: ",'s');
    X0= str2sym(strX0);
    strY0= input("Ingrese el valor de Yo: ",'s');
    Y0= str2sym(strY0);
    disp(" ")

    DXFuncion= diff(funcion,x);
    DYFuncion= diff(funcion,y);

    GradX=subs(DXFuncion,[x,y],[X0,Y0]);
    GradY=subs(DYFuncion,[x,y],[X0,Y0]);

    disp("dz/dx = "+ string(DXFuncion))
    disp("dz/dx (" + strX0 + "," + strY0 +")= " + string(GradX))
    disp(" ")
    disp("dz/dy = "+ string(DYFuncion))
    disp("dz/dy (" + strX0 + "," + strY0 +")= " + string(GradY))
    disp(" ")
    disp("Vector Gradiente= (" + string(GradX) + "," + string(GradY)+")")
    gradiente= [GradX,GradY];
end
function gradiente= gradienteXYZ()
    syms x y z;
    strFuncion= input("Ingrese la ecuación: f(x,y,z) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strX0= input("Ingrese el valor de Xo: ",'s');
    X0= str2sym(strX0);
    strY0= input("Ingrese el valor de Yo: ",'s');
    Y0= str2sym(strY0);
    strZ0= input("Ingrese el valor de Zo: ",'s');
    Z0= str2sym(strZ0);
    disp(" ")

    DXFuncion= diff(funcion,x);
    DYFuncion= diff(funcion,y);
    DZFuncion= diff(funcion,z);

    GradX=subs(DXFuncion,[x,y,z],[X0,Y0,Z0]);
    GradY=subs(DYFuncion,[x,y,z],[X0,Y0,Z0]);
    GradZ=subs(DZFuncion,[x,y,z],[X0,Y0,Z0]);

    disp("df/dx = "+ string(DXFuncion))
    disp("df/dx (" + strX0 + "," + strY0 + "," + strZ0 +")= " + string(GradX))
    disp(" ")
    disp("df/dy = "+ string(DYFuncion))
    disp("df/dy (" + strX0 + "," + strY0 + "," + strZ0 +")= " + string(GradY))
    disp(" ")
    disp("df/dz = "+ string(DZFuncion))
    disp("df/dz (" + strX0 + "," + strY0 + "," + strZ0 +")= " + string(GradZ))
    disp(" ")
    disp("Vector Gradiente= (" + string(GradX) + "," + string(GradY) + "," + string(GradZ)+")")
    gradiente= [GradX,GradY,GradZ];
end