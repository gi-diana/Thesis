%carico tabella dati di progetto 
load data
%coefficiente di sicurezza
CS=2.5;
CSHertz=1.2;
%calcolo formula di Lewis, modulo normale
data.mn=(lewis_factor(data.Z1)*(data.Cn*1000)*2*cosd(data.beta)/(data.sigmaS/CS)/data.larghezza/data.Z1)^(1/3);
%calcolo rapporto di trasmissione
data.tau=data.Z2/data.Z1;
%calcolo raggi primitivi 
R1=0.5*data.mn*data.Z1;
R2=0.5*data.mn*data.Z2;
%calcolo forze
data.Ft=data.Cn*1000/R1;
data.F0=data.Ft/cosd(data.alfa);
data.Fr=data.F0*sind(data.alfa);
F=data.Ft/cosd(data.alfa)/cosd(data.beta);
data.Fa=F*sind(data.beta);

%calcolo tensione di contatto Hertz
data.sigmaH=0.629*0.418*((data.Ft/cosd(data.alfa))*(data.E*1000)*((1/R1)+(1/R2))*(1/sind(data.alfa))/(data.larghezza/cosd(data.beta)))^(1/2);
if data.sigmaH<(data.sigmaS/CSHertz)
    data.Hertz="SI";
else
    data.Hertz="NO";
end

data
writetable(data,'POLSO3.xls');






