function Divergencia()
    disp("¿Qué divergencia desea calcular?")
    disp("1. Divergencia de F(r,theta,z)")
    disp("2. Divergencia de F(rho,theta,phi)")
    disp("3. Divergencia de F(xi,eta,phi) (Parabólicas)")
    disp("4. Divergencia de F(xi,eta,phi) (Toroidales)")
    disp("5. Divergencia de F(xi,eta,phi) (Biesfericas)")
    disp("6. Divergencia de F(xi,eta,phi) (Esferoidal Oblato)")
    disp("7. Divergencia de F(xi,eta,phi) (Esferoidal Prolato)")
    disp("8. Divergencia de F(xi,eta,z) (Cilindricas Elipticas)")
    disp("9. Divergencia de F(xi,eta,z) (Cilindricas Parabolicas)")
    disp("10. Divergencia de F(xi,eta,z) (Bipolar Cilindrica)")
    disp(" ")
    opcion=input("Ingrese el número de la opcion: ");
    disp(" ")
    switch (opcion)
        case 1
            divergenciaCilindricas();
        case 2
            divergenciaEsfericas();
        case 3
            divergenciaParabolicas();
        case 4
            divergenciaToroidales();
        case 5
            divergenciaBiesfericas();
        case 6
            divergenciaEsferoidalOblato();
        case 7
            divergenciaEsferoidalProlato();
        case 8
            divergenciaCilindricasElipticas();
        case 9
            divergenciaCilindricasParabolicas();
        case 10
            divergenciaBipolarCilindrica();
        otherwise
            disp("Opción Inválida")
    end
            
end

function divergenciaCilindricas()
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
    disp("Divergencia= (1/(Hr*Htheta*Hz)) * ((D(A1*Htheta*Hz))/Dr) + (D(A2*Hr*Hz))/Dtheta) + (D(A3*Hr*Htheta))/Dz))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,r);
    SA2=diff(A2*Hr*Hz,theta);
    SA3=diff(A3*Htheta*Hr,z);
    disp("1/(Hr*Htheta*Hz)= " + string(aches))
    disp("D(A1*Htheta*Hz)/Dr=" + string(SA1))
    disp("D(A2*Hr*Hz)/Dtheta=" + string(SA2))
    disp("D(A3*Hr*Htheta)/Dz=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaEsfericas()
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
    disp("Divergencia= (1/(Hrho*Htheta*Hphi)) * ((D(A1*Htheta*Hphi))/Drho) + (D(A2*Hrho*Hphi))/Dtheta) + (D(A3*Hrho*Htheta))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,rho);
    SA2=diff(A2*Hr*Hz,theta);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Hrho*Htheta*Hphi)= " + string(aches))
    disp("D(A1*Htheta*Hphi)/Drho=" + string(SA1))
    disp("D(A2*Hrho*Hphi)/Dtheta=" + string(SA2))
    disp("D(A3*Hrho*Htheta)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaParabolicas()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hphi)) * ((D(A1*Hxi*Hphi))/Deta) + (D(A2*Heta*Hphi))/Dxi) + (D(A3*Heta*Hxi))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Heta*Hxi*Hphi)= " + string(aches))
    disp("D(A1*Hxi*Hphi)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hphi)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaToroidales()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hphi)) * ((D(A1*Hxi*Hphi))/Deta) + (D(A2*Heta*Hphi))/Dxi) + (D(A3*Heta*Hxi))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Heta*Hxi*Hphi)= " + string(aches))
    disp("D(A1*Hxi*Hphi)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hphi)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaBiesfericas()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hphi)) * ((D(A1*Hxi*Hphi))/Deta) + (D(A2*Heta*Hphi))/Dxi) + (D(A3*Heta*Hxi))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Heta*Hxi*Hphi)= " + string(aches))
    disp("D(A1*Hxi*Hphi)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hphi)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaEsferoidalOblato()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hphi)) * ((D(A1*Hxi*Hphi))/Deta) + (D(A2*Heta*Hphi))/Dxi) + (D(A3*Heta*Hxi))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Heta*Hxi*Hphi)= " + string(aches))
    disp("D(A1*Hxi*Hphi)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hphi)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaEsferoidalProlato()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,phi), diff(Y,phi), diff(Z,phi)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hphi= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (phi): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hphi)) * ((D(A1*Hxi*Hphi))/Deta) + (D(A2*Heta*Hphi))/Dxi) + (D(A3*Heta*Hxi))/Dphi))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,phi);
    disp("1/(Heta*Hxi*Hphi)= " + string(aches))
    disp("D(A1*Hxi*Hphi)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hphi)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dphi=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaCilindricasElipticas()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hz= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (z): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hz)) * ((D(A1*Hxi*Hz))/Deta) + (D(A2*Heta*Hz))/Dxi) + (D(A3*Heta*Hxi))/Dz))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,z);
    disp("1/(Heta*Hxi*Hz)= " + string(aches))
    disp("D(A1*Hxi*Hz)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hz)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dz=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end

function divergenciaCilindricasParabolicas()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hz= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (z): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hz)) * ((D(A1*Hxi*Hz))/Deta) + (D(A2*Heta*Hz))/Dxi) + (D(A3*Heta*Hxi))/Dz))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,z);
    disp("1/(Heta*Hxi*Hz)= " + string(aches))
    disp("D(A1*Hxi*Hz)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hz)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dz=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end


function divergenciaBipolarCilindrica()
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
    R1=[diff(X,eta), diff(Y,eta), diff(Z,eta)];
    Hr=simplify(sqrt(R1(1)*R1(1)+R1(2)*R1(2)+R1(3)*R1(3)));
    R2=[diff(X,xi), diff(Y,xi), diff(Z,xi)];
    Htheta=simplify(sqrt(R2(1)*R2(1)+R2(2)*R2(2)+R2(3)*R2(3)));
    R3=[diff(X,z), diff(Y,z), diff(Z,z)];
    Hz=simplify(sqrt(R3(1)*R3(1)+R3(2)*R3(2)+R3(3)*R3(3)));
    disp("Heta= " + string(Hr))
    disp("Hxi= " + string(Htheta))
    disp("Hz= " + string(Hz))
    disp(" ")
    A1=input("Ingrese la primera coordenada del campo (eta): ");
    A2=input("Ingrese la segunda coordenada del campo (xi): ");
    A3=input("Ingrese la tercera coordenada del campo (z): ");
    disp(" ");
    disp("Divergencia= (1/(Heta*Hxi*Hz)) * ((D(A1*Hxi*Hz))/Deta) + (D(A2*Heta*Hz))/Dxi) + (D(A3*Heta*Hxi))/Dz))")
    aches= 1/(Hr*Htheta*Hz);
    SA1=diff(A1*Htheta*Hz,eta);
    SA2=diff(A2*Hr*Hz,xi);
    SA3=diff(A3*Htheta*Hr,z);
    disp("1/(Heta*Hxi*Hz)= " + string(aches))
    disp("D(A1*Hxi*Hz)/Deta=" + string(SA1))
    disp("D(A2*Heta*Hz)/Dxi=" + string(SA2))
    disp("D(A3*Heta*Hxi)/Dz=" + string(SA3))
    div=aches*(SA1+SA2+SA3);
    div=simplify(div);
    disp(" ")
    disp("Divergencia= " + string(div));
end
