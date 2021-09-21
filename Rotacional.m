function Rotacional()
    disp("¿Qué rotacional desea calcular?")
    disp("1. Rotacional de F(r,theta,z)")
    disp("2. Rotacional de F(rho,theta,phi)")
    disp("3. Rotacional de F(xi,eta,phi) (Parabólicas)")
    disp("4. Rotacional de F(xi,eta,phi) (Toroidales)")
    disp("5. Rotacional de F(xi,eta,phi) (Biesfericas)")
    disp("6. Rotacional de F(xi,eta,phi) (Esferoidal Oblato)")
    disp("7. Rotacional de F(xi,eta,phi) (Esferoidal Prolato)")
    disp("8. Rotacional de F(xi,eta,z) (Cilindricas Elipticas)")
    disp("9. Rotacional de F(xi,eta,z) (Cilindricas Parabolicas)")
    disp("10. Rotacional de F(xi,eta,z) (Bipolar Cilindrica)")
    disp(" ")
    opcion=input("Ingrese el número de la opcion: ");
    disp(" ")
    switch(opcion)
        case 1
            rotacionalCilindricas();
        case 2
            rotacionalEsfericas();
        case 3
            rotacionalParabolicas();
        case 4
            rotacionalToroidales();
        case 5
            rotacionalBiesfericas();
        case 6
            rotacionalEsferoidalOblato();
        case 7
            rotacionalEsferoidalProlato();
        case 8
            rotacionalCilindricasElipticas();
        case 9
            rotacionalCilindricasParabolicas();
        case 10
            rotacionalBipolarCilindrica();
        otherwise
            disp("Opción inválida")
    end
end

function rotacionalCilindricas()
    syms r theta z
    X= r*cos(theta);
    Y= r*sin(theta);
    Z= z;
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,r), diff(Y,r), diff(Z,r)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,theta), diff(Y,theta), diff(Z,theta)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hr= " + string(Hr))
    disp("Htheta= " + string(Htheta))
    disp("Hz= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (r): ");
    A2=input("Ingrese la segunda coordenada del campo (theta): ");
    A3=input("Ingrese la tercera coordenada del campo (z): ");
    disp(" ");
    disp("Rotacional= (1/(Hr*Htheta*Hz)) * { Hr*((D(Hz*A3)/Dtheta)-(D(Htheta*A2)/Dz)) , -Htheta*((D(Hz*A3)/Dr)-(D(Hr*A1)/Dz)) , Hz*((D(Htheta*A2)/Dr)-(D(Hr*A1)/Dtheta)) }")
    aches= 1/(Hr*Htheta*Hz);
    SA1=Hr*((diff(Hz*A3,theta))-(diff(Htheta*A2,z)));
    SA2=-Htheta*((diff(Hz*A3,r))-(diff(Hr*A1,z)));
    SA3=Hz*((diff(Htheta*A2,r))-(diff(Hr*A1,theta)));
    disp("1/(Hr*Htheta*Hz)= " + string(aches))
    disp("Hr*((D(Hz*A3)/Dtheta)-(D(Htheta*A2)/Dz))= " + string(SA1))
    disp("Htheta*((D(Hz*A3)/Dr)-(D(Hr*A1)/Dz))= " + string(SA2))
    disp("Hz*((D(Htheta*A2)/Dr)-(D(Hr*A1)/Dtheta))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalEsfericas()
    syms rho theta phi
    X= rho*sin(phi)*cos(theta);
    Y= rho*sin(phi)*sin(theta);
    Z= rho*cos(phi);
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,rho), diff(Y,rho), diff(Z,rho)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,theta), diff(Y,theta), diff(Z,theta)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hrho= " + string(Hr))
    disp("Htheta= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (rho): ");
    A2=input("Ingrese la segunda coordenada del campo (theta): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Rotacional= (1/(Hrho*Htheta*Hphi)) * { Hrho*((D(Hphi*A3)/Dtheta)-(D(Htheta*A2)/Dphi)) , -Htheta*((D(Hphi*A3)/Drho)-(D(Hrho*A1)/Dphi)) , Hphi*((D(Htheta*A2)/Drho)-(D(Hrho*A1)/Dtheta)) }")
    aches= 1/(Hr*Htheta*Hz);
    SA1=Hr*((diff(Hz*A3,theta))-(diff(Htheta*A2,phi)));
    SA2=-Htheta*((diff(Hz*A3,rho))-(diff(Hr*A1,phi)));
    SA3=Hz*((diff(Htheta*A2,rho))-(diff(Hr*A1,theta)));
    disp("1/(Hrho*Htheta*Hphi)= " + string(aches))
    disp("Hrho*((D(Hphi*A3)/Dtheta)-(D(Htheta*A2)/Dphi))= " + string(SA1))
    disp("Htheta*((D(Hphi*A3)/Drho)-(D(Hrho*A1)/Dphi))= " + string(SA2))
    disp("Hphi*((D(Htheta*A2)/Drho)-(D(Hrho*A1)/Dtheta))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalParabolicas()
    syms xi eta phi
    X= eta*xi*cos(phi);
    Y= eta*xi*sin(phi);
    Z= (xi^2-eta^2)/2;
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hr))
    disp("Heta= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (xi): ");
    A2=input("Ingrese la segunda coordenada del campo (eta): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Rotacional= (1/(Hxi*Heta*Hphi)) * { Hxi*((D(Hphi*A3)/Deta)-(D(Heta*A2)/Dphi)) , -Heta*((D(Hphi*A3)/Dxi)-(D(Hxi*A1)/Dphi)) , Hphi*((D(Heta*A2)/Dxi)-(D(Hxi*A1)/Deta)) }")
    aches= 1/(Hr*Htheta*Hz);
    SA1=Hr*((diff(Hz*A3,eta))-(diff(Htheta*A2,phi)));
    SA2=-Htheta*((diff(Hz*A3,xi))-(diff(Hr*A1,phi)));
    SA3=Hz*((diff(Htheta*A2,xi))-(diff(Hr*A1,eta)));
    disp("1/(Hxi*Heta*Hphi)= " + string(aches))
    disp("Hxi*((D(Hphi*A3)/Deta)-(D(Heta*A2)/Dphi))= " + string(SA1))
    disp("Heta*((D(Hphi*A3)/Dxi)-(D(Hxi*A1)/Dphi))= " + string(SA2))
    disp("Hphi*((D(Heta*A2)/Dxi)-(D(Hxi*A1)/Deta))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalToroidales()
    syms xi eta phi
    X= (sinh(eta)*cos(phi))/(cosh(eta)-cos(xi));
    Y= (sinh(eta)*sin(phi))/(cosh(eta)-cos(xi));
    Z= (sin(xi))/(cosh(eta)-cos(xi));
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hphi= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (phi): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hphi*Hxi)) * { Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi)) , -Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,phi))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,phi)));
    disp("1/(Heta*Hphi*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi))= " + string(SA1))
    disp("-Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalBiesfericas()
    syms xi eta phi
    X= (sin(xi)*cos(phi))/(cosh(eta)-cos(xi));
    Y= (sin(xi)*sin(phi))/(cosh(eta)-cos(xi));
    Z= (sinh(eta))/(cosh(eta)-cos(xi));
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hphi= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (phi): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hphi*Hxi)) * { Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi)) , -Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,phi))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,phi)));
    disp("1/(Heta*Hphi*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi))= " + string(SA1))
    disp("-Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalEsferoidalOblato()
    syms xi eta phi
    X= cosh(eta)*cos(xi)*cos(phi);
    Y= cosh(eta)*cos(xi)*sin(phi);
    Z= sinh(eta)*sin(xi);
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hphi= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (phi): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hphi*Hxi)) * { Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi)) , -Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,phi))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,phi)));
    disp("1/(Heta*Hphi*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi))= " + string(SA1))
    disp("-Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalEsferoidalProlato()
    syms xi eta phi
    X= sinh(eta)*sin(xi)*cos(phi);
    Y= sinh(eta)*sin(xi)*sin(phi);
    Z= cosh(eta)*cos(xi);
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hphi= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (phi): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hphi*Hxi)) * { Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi)) , -Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,phi))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,phi)));
    disp("1/(Heta*Hphi*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dphi)-(D(Hphi*A2)/Dxi))= " + string(SA1))
    disp("-Hphi*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hphi*A2)/Deta)-(D(Heta*A1)/Dphi))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalCilindricasElipticas()
    syms xi eta z
    X= cosh(eta)*cos(xi);
    Y= sinh(eta)*sin(xi);
    Z= z;
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hz= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (z): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hz*Hxi)) * { Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi)) , -Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,z))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,z)));
    disp("1/(Heta*Hz*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi))= " + string(SA1))
    disp("-Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalCilindricasParabolicas()
    syms xi eta z
    X= xi*eta;
    Y= (eta^2-xi^2)/2;
    Z= z;
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hz= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (z): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hz*Hxi)) * { Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi)) , -Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,z))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,z)));
    disp("1/(Heta*Hz*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi))= " + string(SA1))
    disp("-Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end

function rotacionalBipolarCilindrica()
    syms xi eta z
    X= (sinh(eta))/(cosh(eta)-cos(xi));
    Y= (sin(xi))/(cosh(eta)-cos(xi));
    Z= z;
    disp("Coordenadas")
    disp("X= "+ string(X));
    disp("Y= "+ string(Y));
    disp("Z= "+ string(Z));
    disp(" ")
    disp("Factores de Forma:")
    R1=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Hxi=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Heta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hphi=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Hxi= " + string(Hxi))
    disp("Heta= " + string(Heta))
    disp("Hz= " + string(Hphi))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (z): ");
    A3=input("Ingrese la tercera coordenada del campo (xi): ");
    disp(" ");
    disp("Rotacional= (1/(Heta*Hz*Hxi)) * { Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi)) , -Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi)) , Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz)) }")
    aches= 1/(Heta*Hphi*Hxi);
    SA1=Heta*((diff(Hxi*A3,z))-(diff(Hphi*A2,xi)));
    SA2=-Hphi*((diff(Hxi*A3,eta))-(diff(Heta*A1,xi)));
    SA3=Hxi*((diff(Hphi*A2,eta))-(diff(Heta*A1,z)));
    disp("1/(Heta*Hz*Hxi)= " + string(aches))
    disp("Heta*((D(Hxi*A3)/Dz)-(D(Hz*A2)/Dxi))= " + string(SA1))
    disp("-Hz*((D(Hxi*A3)/Deta)-(D(Heta*A1)/Dxi))= " + string(SA2))
    disp("Hxi*((D(Hz*A2)/Deta)-(D(Heta*A1)/Dz))= " + string(SA3))
    Rot1=aches*SA1;
    Rot1 = expand(Rot1);
    Rot1 = simplify(collect(Rot1));
    Rot2=simplify(aches*SA2);
    Rot2 = expand(Rot2);
    Rot2 = simplify(collect(Rot2));
    Rot3=simplify(aches*SA3);
    Rot3 = expand(Rot3);
    Rot3 = simplify(collect(Rot3));
    disp(" ")
    disp("Rotacional= { " + string(Rot1) + " , " + string(Rot2) + " , " + string(Rot3) + " }");
end