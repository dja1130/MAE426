# MAE426
Propulsion Fall 2018 Final Project

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
piD=.9;
ec=0.9;
piB= 0.98;
ettaB=0.98;
et=0.91;
ettaM=0.99;
piN=0.95;
p9=po;
piC=20

pto= po*((1+((gamma-1)*((Mo^2)/2)))^(gamma/(gamma-1)));
pt2=pto*piD;
tto=to*(1+(gamma-1)*(Mo^2)/2);
tt2=tto;
tauR=(tto/to)

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
SFC=f/NDST/ao*3600*1000 %
ettath=((((1+f)*((v9^2)/2)-((vo^2)/2))/(f*Qr)))
ethtap=NDST*ao*vo/((1+f)*v9^2/2-vo^2/2)


% Problem 4.25
clc
clear all
why

Mo=.8;
R=287;
gamma1=1.4;
gamma2= 1.33;
cpc=1004;
cph=1156;
%From 37 Kft then converted to SI
To=216.67; %R
Po=21.732; %KPa

ao=sqrt(gamma1*To*R);
vo=Mo*ao;
piD=.995;
piC=40;
ec=.9;
alpha=6;
piF=1.6;
piFN=.98;
ef=.9;
tauL=7;
QR=42800000;
piB=0.95;
ettaB= .98;
et=0.9;
piN=0.98;
ettaM=.975;

Pto=Po*(1+.2*Mo^2)^(gamma1/(gamma1-1));
Tto=To*(1+0.2*0.8^2);
Pt2=Pto*piD;
Tt2=Tto;
tauC=piC^((gamma1-1)/(ec*gamma1));

Tt3=Tt2*tauC;
Pt3=Pt2*piC;

Tt4=cpc*To*tauL/cph;
Pt4=Pt3*piB;

Pt13=Pt2*piF;
Tt13= Tt2*piF^((gamma1-1)/(gamma1*et));
Pt19=piFN*Pt13;
Tt19=Tt13;
T19=Tt19/1.2
P19= Pt19/(1+(gamma1-1)/2)^(gamma1/(gamma1-1));
%P19> Po

a19=sqrt(R*gamma1*Tt19);
%M19=1 so v19=a19
v19=a19

f=(cph*Tt4-cpc*Tt3)/(QR*ettaB-cph*Tt4) %answer B
Tt5=Tt4-(cpc*(Tt3-Tt2)+alpha*cpc*(Tt13-Tt2))/((1+f)*cph*ettaM);
tauT=Tt5/Tt4;
piT=tauT^(gamma2/((gamma2-1)*et));
Pt5= Pt4*piT;
Pt9=Pt5*piN;
P9=Pt9/((gamma2+1)/2)^(gamma2/(gamma2-1));
Tt9=Tt5
T9=Tt5/((gamma2+1)/2);
a9= sqrt(gamma2*R*T9);
v9=a9;

PowerRatio=(Tt3-Tt2)/(Tt13-Tt2) % Answer A
VelocityRatio= v19/v9 %Answer C

v19eff= v19+(P19-Po)*R*T19/P19/v19
v9eff= v9+(a9^2)*(1-(Po/P9))/(gamma2*v9)

FfanOverFcore= alpha*(v19eff-vo)/((1+f)*v9eff-vo) %Answer D


%Carnot= 1-(TH/TL)
T=[ Tt2 Tt3 Tt4 Tt5 Tt9 Tt13];
TH=max(T)
TL=min(T)
Carnot= 1-(TL/TH)
ettaTH= (alpha*(v19eff^2)+(1+f)*(v9eff^2)-(1+alpha)*(vo^2))/(2*f*QR) 
% carnot roughly double Answer E



ettaP=2*((alpha*(v19eff-vo))+((1+f)*v9eff-vo))*vo/((alpha*(v19eff^2))+(1+f)*(v9eff^2)-(1+alpha)*(vo^2)) %Answer F

NDST= ((alpha*v19eff-alpha*vo)+((1+f)*v9eff-vo))/((1+alpha)*ao)


TSFC= (f*10^6)/((1+alpha)*ao)/NDST %Answer G in mg/s/N

% S(2) = load('')
% sound(S(2).y,S(2).Fs)







