function CoordenadasCilindricas()
    syms x y z r theta
    disp(" ")
    strCar= input("Ingrese las coordenas cartesianas: ",'s');
    disp(" ")
    disp("Equivalencias: ")
    disp("x^2 + y^2 = r^2")
    disp("y/x = tan(theta)")
    disp("x= r*cos(theta)")
    disp("y= r*sin(theta)")
    disp(" ")
    Car= str2sym(strCar);
    Cil= subs(Car,(x^2+y^2),r^2);
    Cil= subs(Cil,(y/x),tan(theta));
    Cil= subs(Cil,[x,y],[r*cos(theta), r*sin(theta)]);
    disp("La ecuación en coordenadas cilíndricas es: " + string(Cil))
end