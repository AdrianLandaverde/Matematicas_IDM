function Vectores()
    disp(" ")
    disp("¿Qué desea hacer?")
    disp("1. Producto escalar de dos vectores")
    disp("2. Ángulo entre 2 vectores")
    disp("3. Distancia entre 2 vectores")
    disp("4. Norma de un vector")
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