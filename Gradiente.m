function Gradiente()
    disp("¿Qué gradiente desea calcular?")
    disp("1. Gradiente de F(x,y)")
    disp("2. Gradiente de F(x,y,z)")
    disp("3. Gradiente de F(r,theta)")
    disp("4. Gradiente de F(r,theta,z)")
    disp("5. Gradiente de F(rho,theta,phi)")
    disp("6. Gradiente de F(xi,eta,phi) (Parabólicas)")
    disp("7. Gradiente de F(xi,eta,phi) (Toroidales)")
    disp("8. Gradiente de F(xi,eta,phi) (Biesfericas)")
    disp("9. Gradiente de F(xi,eta,phi) (Esferoidal Oblato)")
    disp("10. Gradiente de F(xi,eta,phi) (Esferoidal Prolato)")
    disp("11. Gradiente de F(xi,eta,z) (Cilindricas Elipticas)")
    disp("12. Gradiente de F(xi,eta,z) (Cilindricas Parabolicas)")
    disp("13. Gradiente de F(xi,eta,z) (Bipolar Cilindrica)")
    disp(" ")
    opcion= input("Ingrese el número de la opción: ");
    if(opcion==1)
        gradienteXY();
    elseif(opcion==2)
        gradienteXYZ();
    elseif(opcion==3)
        gradienteRT();
    elseif(opcion==4)
        gradienteRTZ();
    elseif(opcion==5)
        gradienteRTP();
    elseif(opcion==6)
        gradienteParabolicas();
    elseif(opcion==7)
        gradienteToroidales();
    elseif(opcion==8)
        gradienteBiesfericas();
    elseif(opcion==9)
        gradienteEsferoidalOblato();
    elseif(opcion==10)
        gradienteEsferoidalProlato();
    elseif(opcion==11)
        gradienteCilindricasElipticas();
    elseif(opcion==12)
        gradienteCilindricasParabolicas();
    elseif(opcion==13)
        gradienteBipolarCilindrica();
    else
        disp("Opción Inválida")
        disp(" ")
    end
end
function gradienteXY()
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
end
function gradienteXYZ()
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
end

function gradienteRT()
    syms r theta;
    strFuncion= input("Ingrese la ecuación: F(r,theta) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strR0= input("Ingrese el valor de Ro: ",'s');
    R0= str2sym(strR0);
    strT0= input("Ingrese el valor de THETAo: ",'s');
    T0= str2sym(strT0);
    disp(" ")

    DRFuncion= diff(funcion,r);
    DTFuncion= diff(funcion,theta);
    DTRFuncion= DTFuncion*(1/r);

    GradR=subs(DRFuncion,[r,theta],[R0,T0]);
    GradT=subs(DTRFuncion,[r,theta],[R0,T0]);

    disp("df/dr = "+ string(DRFuncion))
    disp("df/dr (" + strR0 + "," + strT0 +")= " + string(GradR))
    disp(" ")
    disp("df/dtheta = "+ string(DTFuncion))
    disp("(df/dtheta)*(1/r) = "+ string(DTRFuncion))
    disp("(df/dtheta)*(1/r) (" + strR0 + "," + strT0 +")= " + string(GradT))
    disp(" ")
    disp("Vector Gradiente= (" + string(GradR) + "," + string(GradT)+")")  
end

function gradienteRTZ()
    syms r theta z;
    strFuncion= input("Ingrese la ecuación: F(r,theta,z) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strR0= input("Ingrese el valor de Ro: ",'s');
    R0= str2sym(strR0);
    strT0= input("Ingrese el valor de THETAo: ",'s');
    T0= str2sym(strT0);
    strZ0= input("Ingrese el valor de Zo: ",'s');
    Z0= str2sym(strZ0);
    disp(" ")

    DRFuncion= diff(funcion,r);
    DTFuncion= diff(funcion,theta);
    DTRFuncion= DTFuncion*(1/r);
    DZFuncion= diff(funcion,z);

    GradR=subs(DRFuncion,[r,theta,z],[R0,T0,Z0]);
    GradT=subs(DTRFuncion,[r,theta,z],[R0,T0,Z0]);
    GradZ=subs(DZFuncion,[r,theta,z],[R0,T0,Z0]);

    disp("df/dr = "+ string(DRFuncion))
    disp("df/dr (" + strR0 + "," + strT0 + "," + strT0 +")= " + string(GradR))
    disp(" ")
    disp("df/dtheta = "+ string(DTFuncion))
    disp("(df/dtheta)*(1/r) = "+ string(DTRFuncion))
    disp("(df/dtheta)*(1/r) (" + strR0 + "," + strT0 + "," + strT0 +")= " + string(GradT))
    disp(" ")
    disp("df/dz = "+ string(DZFuncion))
    disp("df/dz (" + strR0 + "," + strT0 + "," + strZ0 +")= " + string(GradZ))
    disp(" ")
    disp("Vector Gradiente= (" + string(GradR) + "," + string(GradT) + "," + string(GradZ) + ")")  
end

function gradienteRTP()
    syms rho theta phi;
    strFuncion= input("Ingrese la ecuación: F(rho,theta,phi) = ",'s');
    funcion= str2sym(strFuncion);
    disp(" ")
    strP0= input("Ingrese el valor de RHOo: ",'s');
    P0= str2sym(strP0);
    strT0= input("Ingrese el valor de THETAo: ",'s');
    T0= str2sym(strT0);
    strPHI0= input("Ingrese el valor de PHIo: ",'s');
    PHI0= str2sym(strPHI0);
    disp(" ")

    DPFuncion= diff(funcion,p);
    DTFuncion= diff(funcion,theta);
    DTPFuncion= DTFuncion*(1/(p*sin(phi)));
    DPHIFuncion= diff(funcion,phi);
    DPHIPFuncion= DPHIFuncion*(1/p);

    GradP=subs(DPFuncion,[p,theta,phi],[P0,T0,PHI0]);
    GradT=subs(DTPFuncion,[p,theta,phi],[P0,T0,PHI0]);
    GradPHI=subs(DPHIPFuncion,[p,theta,phi],[P0,T0,PHI0]);

    disp("df/dp = "+ string(DPFuncion))
    disp("df/dp (" + strP0 + "," + strT0 + "," + strPHI0 +")= " + string(GradP))
    disp(" ")
    disp("df/dtheta = "+ string(DTFuncion))
    disp("(df/dtheta)*(1/(p*sin(phi))) = "+ string(DTPFuncion))
    disp("(df/dtheta)*(1/(p*sin(phi))) (" + strP0 + "," + strT0 + "," + strPHI0 +")= " + string(GradT))
    disp(" ")
    disp("df/dphi = "+ string(DPHIFuncion))
    disp("(df/dphi)*(1/p) = "+ string(DTPFuncion))
    disp("(df/dphi)*(1/p) (" + strP0 + "," + strT0 + "," + strPHI0 +")= " + string(GradPHI))
    disp(" ")
    disp("Vector Gradiente= (" + string(GradP) + "," + string(GradT) + "," + string(GradPHI) + ")")  
end

function gradienteParabolicas()
    disp(" ")
    syms xi eta phi
    X= xi*eta*cos(phi);
    Y= xi*eta*sin(phi);
    Z= (eta^2-xi^2)/2;
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
    funcion=input("Ingrese la función: F(xi,eta,phi)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dphi)/Hphi }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dphi)/Hphi= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteToroidales()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,phi)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dphi)/Hphi }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dphi)/Hphi= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteBiesfericas()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,phi)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dphi)/Hphi }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dphi)/Hphi= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteEsferoidalOblato()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,phi)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dphi)/Hphi }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dphi)/Hphi= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteEsferoidalProlato()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,phi)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dphi)/Hphi }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dphi)/Hphi= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteCilindricasElipticas()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,z)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dz)/Hz }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dz)/z= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteCilindricasParabolicas()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,z)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dz)/Hz }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dz)/z= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end

function gradienteBipolarCilindrica()
    disp(" ")
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
    funcion=input("Ingrese la función: F(xi,eta,z)= ");
    Gxi= diff(funcion,xi)/Hxi;
    Geta= diff(funcion,eta)/Heta;
    Gphi= diff(funcion,phi)/Hphi;
    disp(" ")
    disp("Gradiente= { (Df/Dxi)/Hxi , (Df/Deta)/Heta , (Df/Dz)/Hz }")
    disp("(Df/Dxi)/Hxi= " + string(diff(funcion,xi)) + " / " + string(Hxi))
    disp("(Df/Deta)/Heta= " + string(diff(funcion,eta)) + " / " + string(Heta))
    disp("(Df/Dz)/z= " + string(diff(funcion,phi)) + " / " + string(Hphi))
    disp(" ")
    disp("Gradiente= { " + string(Gxi) + " , " + string(Geta) + " , " + string(Gphi) + " } ")
end