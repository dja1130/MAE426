
clear all
Mo=2.0;
R=287;
%from
h=37e3;
%we get
to=216.667; %k
po=21.73; %kPa
Qr=42800000; %j/kg
cpc=1004;
cph=1156 ;
cpAB=1423; %j/kgK
gamma=1.4;
gamma2=1.33;
gamma3=1.3;
tauL=7;
ao=sqrt(gamma*R*to);
vo=Mo*ao;
piD=1;
ec=1;
piB= 1;
ettaB=1;
et=1;
ettaM=1;
piN=1;
p9=po;

pto= po*((1+((gamma-1)*((Mo^2)/2)))^(gamma/(gamma-1)));
pt2=pto*piD;
tto=to*(1+(gamma-1)*(Mo^2)/2);
tt2=tto;
tauR=(tto/to)


for piC= 1:1:40

pt2=piD*pto
pt3=pt2*piC;
tauC=piC^((gamma-1)/(gamma*ec));    
tt3=tt2*tauC;
tt4=(cpc*to*tauL)/cph;
pt4=pt3*piB;


f=(tauL-tauC*tauR)/((Qr*ettaB/(cpc*to))-tauL)

tt5=tt4-(cpc*(tt3-tt2)/(cph*ettaM*(1+f)));
tauT=(tt5/tt4);
piT=(tauT)^(gamma2/(gamma2-1)*et);
pt5=pt4*piT
pt7=pt5
pt9=pt7*piN
tt7=tt5
tt9=tt7
M9=sqrt((2/(gamma2-1))*(((pt9/p9)^((gamma2-1)/gamma2)-1)))
t9=tt9/(1+(gamma2-1)*M9^2/2)
a9=sqrt(gamma2*t9*R)
v9=M9*a9
NDST=(1+f)*v9/ao-Mo


plot(piC,NDST,'.')
hold on


end


figure 
for piC= 1:1:40

pt2=piD*pto
pt3=pt2*piC;
tauC=piC^((gamma-1)/(gamma*ec));    
tt3=tt2*tauC;
tt4=(cpc*to*tauL)/cph;
pt4=pt3*piB;


f=(tauL-tauC*tauR)/((Qr*ettaB/(cpc*to))-tauL)

tt5=tt4-(cpc*(tt3-tt2)/(cph*ettaM*(1+f)));
tauT=(tt5/tt4);
piT=(tauT)^(gamma2/(gamma2-1)*et);
pt5=pt4*piT
pt7=pt5
pt9=pt7*piN
tt7=tt5
tt9=tt7
M9=sqrt((2/(gamma2-1))*(((pt9/p9)^((gamma2-1)/gamma2)-1)))
t9=tt9/(1+(gamma2-1)*M9^2/2)
a9=sqrt(gamma2*t9*R)
v9=M9*a9
NDST=(1+f)*v9/ao-Mo

TSFC=f/(NDST*ao)
plot(piC,TSFC,'.')
hold on


end

