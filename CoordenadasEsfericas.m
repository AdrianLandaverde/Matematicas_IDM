function CoordenadasEsfericas()
    syms x y z p phi theta
    disp(" ")
    strCar= input("Ingrese las coordenas cartesianas: ",'s');
    disp(" ")
    disp("Equivalencias: ")
    disp("x^2 + y^2 = r^2")
    disp("y/x = tan(theta)")
    disp("x= p*sin(phi)*cos(theta)")
    disp("y= p*sin(phi)*sin(theta)")
    disp("z= p*cos(phi)")
    disp(" ")
    Car= str2sym(strCar);
    Esf= subs(Car,[x,y,z],[p*sin(phi)*cos(theta), p*sin(phi)*sin(theta),p*cos(phi) ]);
    disp("La ecuación en coordenadas cilíndricas es: " + string(Esf))
end