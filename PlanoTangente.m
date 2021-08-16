function ecuacion= PlanoTangente()
    disp("¿Qué tipo de superficie desea calcular?")
    disp("1. Plano Tangente a z(x,y)")
    disp("2. Plano Tangente a F(x,y,z)")
    
    while true
        opcion= input("Ingrese el número de la opción: ");
        if(opcion==1)
            ecuacion= PlanoTangenteXY();
            break
        elseif(opcion==2)
            ecuacion= PlanoTangenteXYZ();
            break
        else
            disp("Opción Inválida")
            disp(" ")
        end  
    end
end

function ecuacion= PlanoTangenteXY()
    syms x y;
    disp(" ")
    strFuncion= input("Ingrese la ecuación: z(x,y) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strX0= input("Ingrese el valor de Xo: ",'s');
    X0= str2sym(strX0);
    strY0= input("Ingrese el valor de Yo: ",'s');
    Y0= str2sym(strY0);
    
    disp(" ")
    disp("Calcular el valor de Zo:")
    strZ0= replace(strFuncion, ["x","y"], [strX0,strY0]);
    Z0= subs(funcion, [x,y], [X0,Y0]);
    disp("Zo= " + strZ0)
    disp("Zo= " + string(Z0))
    disp(" ")
    
    disp("Se calcula el valor del Gradiente")
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
    disp(" ")
    
    disp("Para determinar el plano tangente se usa la ecuación del plano Tangente")
    strEcuacion="Z= Zo + fx(X-Xo) + fy(Y-Yo)";
    disp(strEcuacion)
    disp(replace(strEcuacion, ["Zo", "fx", "Xo", "fy", "Yo"], [string(Z0), string(GradX), strX0,string(GradY), strY0]))
    ecuacion= Z0 + GradX*(x-X0) + GradY*(y-Y0);
    disp("Z= " + string(ecuacion))
end

function ecuacion= PlanoTangenteXYZ()
    syms x y z;
    disp(" ")
    strFuncion= input("Ingrese la ecuación: F(x,y,z) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strX0= input("Ingrese el valor de Xo: ",'s');
    X0= str2sym(strX0);
    strY0= input("Ingrese el valor de Yo: ",'s');
    Y0= str2sym(strY0);
    strZ0= input("Ingrese el valor de Zo: ",'s');
    Z0= str2sym(strZ0);
    
    disp("Se calcula el valor del Gradiente")
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
    disp(" ")
    
    disp("Para determinar el plano tangente se usa la ecuación del plano Tangente")
    disp("(r-> - ro->)* gradienteF")
    disp("(X-Xo, Y-Yo, Z-Zo)*(dx, dy, dz)")
    strEcuacion="dx*(X-Xo) + dy*(Y-Yo) + dz*(Z-Zo)";
    disp(strEcuacion)
    disp(replace(strEcuacion, ["Xo", "Yo", "Zo", "dx", "dy", "dz"], [strX0, strY0, strZ0, string(GradX), string(GradY), string(GradZ)]))
    ecuacion= GradX*(x-X0) + GradY*(y-Y0) + GradZ*(z-Z0);
    disp(string(ecuacion) + " = 0")
end