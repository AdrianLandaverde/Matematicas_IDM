function VectorUnitarioFactorForma()
    disp("¿En qué coordendas desea ver estos datos?")
    disp("1. Coordendas Polares")
    disp("2. Coordenadas Cilíndricas")
    disp("3. Coordendas Esféricas")
    opcion= input("Ingrese el número de su opción: ");
    disp(" ")
    switch(opcion)
        case 1
            Polares();
        case 2
            Cilindricas();
        case 3
            Esfericas();
        otherwise
            disp("Opción inválida")
    end
        
end

function Polares()
    disp("Vectores Unitarios en coordendas Polares")
    disp("er = < cos(theta) , sen(theta) >")
    disp("etheta = < sen(theta) , cos(theta) >")
    disp(" ")
    disp(" ")
    disp("Factores de Forma")
    disp("r= < r*cos(theta) , r*sin(theta) >")
    disp(" ")
    disp("dr/dr = < cos(theta) , sin(theta) >")
    disp("dr/dr = er*hr")
    disp("hr= 1")
    disp(" ")
    disp("dr/dtheta = < -r*sin(theta) , r*cos(theta) >")
    disp("dr/dtheta = er*htheta")
    disp("htheta= r")
end

function Cilindricas()
    disp("Vectores Unitarios en coordendas Cilindricas")
    disp("er = < cos(theta) , sen(theta) , 0 >")
    disp("etheta = < sen(theta) , cos(theta) , 0 >")
    disp("ez = < 0 , 0 , 1 >")
    disp(" ")
    disp(" ")
    disp("Factores de Forma")
    disp("r= < r*cos(theta) , r*sin(theta) , z>")
    disp(" ")
    disp("dr/dr = < cos(theta) , sin(theta) , 0 >")
    disp("dr/dr = er*hr")
    disp("hr= 1")
    disp(" ")
    disp("dr/dtheta = < -r*sin(theta) , r*cos(theta) , 0>")
    disp("dr/dtheta = etheta*htheta")
    disp("htheta= r")
    disp(" ")
    disp("dr/dz = < 0 , 0 , 1 >")
    disp("dr/dz = ez*hz")
    disp("hz= 1")
end

function Esfericas()
    disp("Vectores Unitarios en coordendas Cilindricas")
    disp("erho = < rho*sen(phi)*cos(theta) , rho*sen(phi)*sen(theta) , rho*cos(phi) >")
    disp("ephi = < cos(phi)*cos(theta) , cos(phi)*sen(theta) , -sen(phi) >")
    disp("etheta = < sen(theta) , cos(theta) , 0 >")
    disp(" ")
    disp(" ")
    disp("Factores de Forma")
    disp("r= < rho*sen(phi)*cos(theta) , rho*sen(phi)*sen(theta) , rho*cos(phi) >")
    disp(" ")
    disp("dr/drho = < sen(phi)*cos(theta) , sen(phi)*sen(theta) , cos(phi) >")
    disp("dr/drho = erho*hrho")
    disp("hr= 1")
    disp(" ")
    disp("dr/dphi = < rho*cos(phi)*cos(theta) , rho*cos(phi)*sin(theta) , -rho*sin(phi) >")
    disp("dr/dphi = ephi*hphi")
    disp("hphi= rho")
    disp(" ")
    disp("dr/dtheta = < -rho*sen(phi)*sen(theta) , rho*sen(phi)*cos(theta) , 0 >")
    disp("dr/dtheta = etheta*htheta")
    disp("htheta= rho*sen(phi)")
end
