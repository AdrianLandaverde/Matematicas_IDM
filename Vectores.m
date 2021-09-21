function Vectores()
    disp(" ")
    disp("¿Qué desea hacer?")
    disp("1. Producto interior de dos vectores")
    disp("2. Ángulo entre 2 vectores")
    disp("3. Distancia entre 2 vectores")
    disp("4. Norma de un vector")
    disp("5. Normalización de un vector")
    disp("6. Método de Gran-Schmidt")
    disp(" ")
    
    while true
        opcion= input("Ingrese el número de la opción: ");
        disp(" ")
        if(opcion==1)
            ProductoEscalar();
            break
        elseif(opcion==2)
            Angulo2Vectores();
            break
        elseif(opcion==3)
            Distancia2Vectores();
            break
        elseif(opcion==4)
            Norma1Vector();
            break
        elseif(opcion==5)
            NormalizarVector();
            break
        elseif(opcion==6)
            GramSchmidt();
            break
        else
            disp("Opción Inválida")
            disp(" ")
        end  
    end
end

function ProductoEscalar()
    vecA= input("Ingrese el primer vector de la forma [a b c ...]: ");
    vecB= input("Ingrese el segundo vector de la forma [a b c ...]: ");
    [m,n]= size(vecA);
    for i= 1:n
        disp(string(vecA(i))+ " x " + string(vecB(i)) + " = " + string(vecA(i)*vecB(i)))
    end
    disp("Producto Escalar= " + string(dot(vecA,vecB)))
end

function Angulo2Vectores()
    vecA= input("Ingrese el primer vector de la forma [a b c ...]: ");
    vecB= input("Ingrese el segundo vector de la forma [a b c ...]: ");
    disp(" ")
    disp("Se sigue la siguiente fórmula: arccos(u x v)/(||u|| x ||v||)")
    productoEscalar= dot(vecA, vecB);
    disp("u x v = " + string(productoEscalar))
    [m,n]= size(vecA);
    strU="";
    strV="";
    for i=1:n
        strU= strU+ " + (" + string(vecA(i))+ ")^2 ";
        strV= strV+ " + (" + string(vecB(i))+ ")^2 ";
    end
    U= str2sym(strU);
    V= str2sym(strV);
    MU= norm(vecA);
    MV= norm(vecB);
    disp("||u|| = raiz cuadrada de: " + string(U) + " = " + string(MU))
    disp("||v|| = raiz cuadrada de: " + string(V) + " = " + string(MV))
    angulo= productoEscalar/(MU*MV);
    disp(" ")
    disp("Ángulo= arccos " + string(angulo))
    angulor= acos(angulo);
    angulod= acosd(angulo);
    disp("Ángulo (radianes)= " + string(angulor))
    disp("Ángulo (grados)= " + string(angulod)) 
end

function Distancia2Vectores()
    vecA= input("Ingrese el primer vector de la forma [a b c ...]: ");
    vecB= input("Ingrese el segundo vector de la forma [a b c ...]: ");
    disp(" ")
    norma= vecA-vecB;
    [m,n]= size(norma);
    strN="(";
    for i=1:n
        strN= strN+ " " + string(norma(i));
    end
    strN= strN+ " )";
    disp("u-v = " + string(strN))
    norma= norm(norma);
    disp("||u-v|| = " + string(norma))
end

function Norma1Vector()
    vecA= input("Ingrese el  vector de la forma [a b c ...]: ");
    [m,n]= size(vecA);
    strN="";
    for i=1:n
        strN= strN+ " + (" + string(vecA(i))+ ")^2 ";
        strV= strV+ " + (" + string(vecB(i))+ ")^2 ";
    end
    norma= str2sym(strN);
    disp("Norma= raiz cuadrada de " + strN)
    disp("Norma= raiz cuadrada de " + string(norma))
    disp("Norma= " + string(sqrt(norma)))
end

function NormalizarVector()
    vecA= input("Ingrese el  vector de la forma [a b c ...]: ");
    [m,n]= size(vecA);
    disp("Vector Unitario= (u)/(||u||)")
    disp(" ")
    strN="";
    strV="(";
    for i=1:n
        strN= strN+ " + (" + string(vecA(i))+ ")^2 ";
        strV= strV+ " "+ string(vecA(i));
    end
    strV=strV+" )";
    norma= str2sym(strN);
    disp("Norma= raiz cuadrada de " + strN)
    disp("Norma= raiz cuadrada de " + string(norma))
    disp("Norma= " + string(sqrt(norma)))
    disp(" ")
    disp("Vector Unitario= u/Norma")
    disp("Vector Unitario= " + strV+"/"+string(norma))
    vectorUnitario= vecA./norma;
    disp("Vector Unitario= ")
    disp(vectorUnitario)
end

function GramSchmidt()
    disp("¿Qué vectores tienes?")
    disp("1. El vector V y el vector U")
    disp("2. Una base {v1, v2}")
    disp("3. Una base {v1, v2, v3}")
    disp(" ")
    opcion= input("Ingrese la opción: ");
    disp(" ")
    if(opcion==1)
        vecU= input("Ingrese el vector u de la forma [a b c ...]: ");
        vecV= input("Ingrese el vector v de la forma [a b c ...]: ");
        disp(" ")
        disp("PROYvU= (u,v)/(||v||^2)(v)")
        disp("w= u-PROYvU")
        disp(" ")
        UV= dot(vecU,vecV);
        V2= dot(vecV,vecV);
        UVV2= str2sym(rat(UV/V2));
        proyVU=UVV2.*vecV;
        w= vecU-proyVU;
        disp("(u,v)= " + string(UV))
        disp("||v||^2= " + string(V2))
        disp("(u,v)/(||v||^2)= " + string(UVV2))
        disp(" ")
        disp("PROYvU= ")
        disp(proyVU)
        disp("w= ")
        disp(w)
        
    elseif (opcion==2)
        v1= input("Ingrese el vector v1 de la forma [a b c ...]: ");
        v2= input("Ingrese el vector v2 de la forma [a b c ...]: ");
        disp("u1= (v1)/(||v1||)")
        disp(" ")
        u1= v1./(sqrt(str2sym(rat(dot(v1,v1)))));
        disp("u1= ")
        disp(u1)
        disp("v2'= v2-(v2*u1)u1")
        v2p= v2-(dot(v2,u1).*u1);
        disp(" ")
        disp("v2'= ")
        disp(v2p)
        disp("u2= (v2')/(||v2'||)")
        u2= v2p./(sqrt(str2sym(rat(dot(v2p,v2p)))));
        disp(" ")
        disp("u2= ")
        disp(u2)
        disp("Base ortonormal= {u1,u2}")
        u1
        u2
    elseif(opcion==3)
        v1= input("Ingrese el vector v1 de la forma [a b c ...]: ");
        v2= input("Ingrese el vector v2 de la forma [a b c ...]: ");
        v3= input("Ingrese el vector v3 de la forma [a b c ...]: ");
        disp("u1= (v1)/(||v1||)")
        disp(" ")
        u1= v1./(sqrt(str2sym(rat(dot(v1,v1)))));
        disp("u1= ")
        disp(u1)
        disp("v2'= v2-(v2*u1)u1")
        v2p= v2-(dot(v2,u1).*u1);
        disp(" ")
        disp("v2'= ")
        disp(v2p)
        disp("u2= (v2')/(||v2'||)")
        u2= v2p./(sqrt(str2sym(rat(dot(v2p,v2p)))));
        disp(" ")
        disp("u2= ")
        disp(u2)
        disp("v3'= v3 - (v3*u1)u1 - (v3*u2)u2")
        v3p= v3-(dot(v3,u1).*u1)-(dot(v3,u2).*u2);
        disp("v3'= ")
        disp(v3p)
        disp("u3= (v3')/(||v3'||)")
        u3= v3p./(sqrt(str2sym(rat(dot(v3p,v3p)))));
        disp(" ")
        disp("u3= ")
        disp(u3)
        disp("Base Ortogonal= {u1, u2, u3}");
        u1
        u2
        u3   
    end
end

