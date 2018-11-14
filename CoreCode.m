clear all
Mo=0.75;
R=287;
g=9.81;
gamma1=1.4;
gamma2=1.33;
gamma3=1.3;
%from
h=10e3; %Km
Tsl= 288.15;
Psl=101.3;
%we get
To=288.15-0.0065*(11000);
Po=Psl*(To/Tsl)^(g/(R*0.0065)); %kPa
QR=42000000; %j/kg
cpc=1004;
cph=1156 ;
cpAB=1423; %j/kgK
gamma=1.4;
gamma2=1.33;
gamma3=1.3;
tauL=7;
%%%%%%%%%%%%%%%%%%%
%perfectly expanded
P9=Po;

ao=sqrt(gamma*R*To);
vo=Mo*ao;
piD=.98;
ec=.9;
piB= 0.95;
ettaB=0.98;
et=0.9;
ettaM=0.98;
piN=0.9;

alpha=10;
piF=1.6;
ef=0.9;
piFN=0.9;


Pto= Po*((1+((gamma-1)*((Mo^2)/2)))^(gamma/(gamma-1)));
Pt2=Pto*piD;
Tto=To*(1+(gamma-1)*(Mo^2)/2);
Tt2=Tto;
tauR=(Tto/To);

Pt13=Pt2*piF; 
Tt13= Tt2*piF^((gamma1-1)/(gamma1*ef)); 
Pt19=piFN*Pt13;
Tt19=Tt13;
T19=Tt19/1.2;
NPRfan=Pt13/Po
%if NPRfan > 1.893 since gamma1 then M19=1 so
P19= Pt19/1.893

piC= 30

Pt2=piD*Pto;
Pt3=Pt2*piC;
tauC=piC^((gamma-1)/(gamma*ec));    
Tt3=Tt2*tauC;
Tt4=(cpc*To*tauL)/cph;
Pt4=Pt3*piB;


f=(tauL-tauC*tauR)/((QR*ettaB/(cpc*To))-tauL);

Tt5=Tt4-(cpc*(Tt3-Tt2)/(cph*ettaM*(1+f)));
tauT=(Tt5/Tt4);
piT=(tauT)^(gamma2/(gamma2-1)*et);
Pt5=Pt4*piT;
Pt7=Pt5;
Pt9=Pt7*piN;
Tt7=Tt5;
Tt9=Tt7;
M9=sqrt((2/(gamma2-1))*(((Pt9/P9)^((gamma2-1)/gamma2)-1)));
T9=Tt9/(1+(gamma2-1)*M9^2/2);
a9=sqrt(gamma2*T9*R);
v9=M9*a9;


a19=sqrt(R*gamma1*T19);
v19=a19;
v19eff= v19+(P19-Po)*R*T19/P19/v19
v9eff= v9+(a9^2)*(1-(Po/P9))/(gamma2*v9)
NDST= ((alpha*v19eff-alpha*vo)+((1+f)*v9eff-vo))/((1+alpha)*ao)

%%% performance 

PowerRatio=(Tt3-Tt2)/(Tt13-Tt2) % Answer A
VelocityRatio= v19/v9 % Answer C
FfanOverFcore= alpha*(v19eff-vo)/((1+f)*v9eff-vo) % Answer D
TNDST= ((alpha*v19eff-alpha*vo)+((1+f)*v9eff-vo))/((1+alpha)*ao) % Answer E
TSFC= (f*10^6)/((1+alpha)*ao)/NDST % Answer F
ettaTH=(alpha*(v19eff^2)+(1+f)*(v9eff^2)-(1+alpha)*(vo^2))/(2*f*QR) % Answer G
ettaP= 2*((alpha*(v19eff-vo))+((1+f)*v9eff-vo))*vo/((alpha*(v19eff^2))+(1+f)*(v9eff^2)-(1+alpha)*(vo^2)) % Answer H
ettaO= ettaP*ettaTH % Answer I