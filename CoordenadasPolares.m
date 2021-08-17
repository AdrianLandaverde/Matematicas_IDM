function CoordenadasPolares()
    syms x y r theta
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
    Polar= subs(Car,(x^2+y^2),r^2);
    Polar= subs(Polar,(y/x),tan(theta));
    Polar= subs(Polar,[x,y],[r*cos(theta), r*sin(theta)]);
    disp("La ecuación en coordenadas polares es: " + string(Polar))
end