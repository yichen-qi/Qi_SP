%{
This section of the code aims to investigate the effect of these 
six features on the simulation results, the control variable method 
is used, i.e., one of the features is changed and the other features 
maintain their standard values. 
The drawing tool is MATLAB's own cftool
%}

load('data')

%PCB thickness extract
%PCB thickness index
PCB_a1 = find(data(:,2)==0.001&data(:,3)==1&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_b1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_c1 = find(data(:,2)==0.001&data(:,3)==1.75&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_d1 = find(data(:,2)==0.001&data(:,3)==2&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);

%temperature for different PCB thickness
Ptem_a = data(PCB_a1',1);
Ptem_b = data(PCB_b1',1);
Ptem_c = data(PCB_c1',1);
Ptem_d = data(PCB_d1',1);

%result for different PCB thickness with different tempreture
Pees_a1 = data(PCB_a1',7);
Pees_b1 = data(PCB_b1',7);
Pees_c1 = data(PCB_c1',7);
Pees_d1 = data(PCB_d1',7);

% PCB thickness index
PCB_a2 = find(data(:,1)==25&data(:,3)==1&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_b2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_c2 = find(data(:,1)==25&data(:,3)==1.75&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
PCB_d2 = find(data(:,1)==25&data(:,3)==2&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);

% amplitude for different PCB thickness
Pamp_a = data(PCB_a2',2);
Pamp_b = data(PCB_b2',2);
Pamp_c = data(PCB_c2',2);
Pamp_d = data(PCB_d2',2);

% result for different PCB thickness with different amplitude
Pees_a2 = data(PCB_a2',7);
Pees_b2 = data(PCB_b2',7);
Pees_c2 = data(PCB_c2',7);
Pees_d2 = data(PCB_d2',7);

% PCB thickness index
PCB_thickness_index = find(data(:,2)==0.001&data(:,1)==25&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);

%value of PCB thickness
PCB_thickness = data(PCB_thickness_index',3);

%result for different PCB thickness with same amplitude and temperature
ess_PCB_thickness = data(PCB_thickness_index',7);

% same as the PCB extract
chip_a1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.3&data(:,5)==300&data(:,6)==25);
chip_b1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
chip_c1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.5&data(:,5)==300&data(:,6)==25);
chip_d1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.6&data(:,5)==300&data(:,6)==25);
chip_e1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.7&data(:,5)==300&data(:,6)==25);

Ctem_a = data(chip_a1',1);
Ctem_b = data(chip_b1',1);
Ctem_c = data(chip_c1',1);
Ctem_d = data(chip_d1',1);
Ctem_e = data(chip_e1',1);

Cees_a1 = data(chip_a1',7);
Cees_b1 = data(chip_b1',7);
Cees_c1 = data(chip_c1',7);
Cees_d1 = data(chip_d1',7);
Cees_e1 = data(chip_e1',7);

chip_a2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.3&data(:,5)==300&data(:,6)==25);
chip_b2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
chip_c2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.5&data(:,5)==300&data(:,6)==25);
chip_d2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.6&data(:,5)==300&data(:,6)==25);
chip_e2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.7&data(:,5)==300&data(:,6)==25);

Camp_a = data(chip_a2',2);
Camp_b = data(chip_b2',2);
Camp_c = data(chip_c2',2);
Camp_d = data(chip_d2',2);
Camp_e = data(chip_e2',2);

Cees_a2 = data(chip_a2',7);
Cees_b2 = data(chip_b2',7);
Cees_c2 = data(chip_c2',7);
Cees_d2 = data(chip_d2',7);
Cees_e2 = data(chip_e2',7);

chip_thickness_index = find(data(:,2)==0.001&data(:,1)==25&data(:,3)==1.5&data(:,5)==300&data(:,6)==25);
chip_thickness = data(chip_thickness_index',4);
ess_chip_thickness = data(chip_thickness_index',7);

SJV_a1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==225&data(:,6)==25);
SJV_b1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==250&data(:,6)==25);
SJV_c1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==275&data(:,6)==25);
SJV_d1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
SJV_e1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==325&data(:,6)==25);

Vtem_a = data(SJV_a1',1);
Vtem_b = data(SJV_b1',1);
Vtem_c = data(SJV_c1',1);
Vtem_d = data(SJV_d1',1);
Vtem_e = data(SJV_e1',1);

Vees_a1 = data(SJV_a1',7);
Vees_b1 = data(SJV_b1',7);
Vees_c1 = data(SJV_c1',7);
Vees_d1 = data(SJV_d1',7);
Vees_e1 = data(SJV_e1',7);

SJV_a2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==225&data(:,6)==25);
SJV_b2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==250&data(:,6)==25);
SJV_c2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==275&data(:,6)==25);
SJV_d2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);
SJV_e2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==325&data(:,6)==25);

Vamp_a = data(SJV_a2',2);
Vamp_b = data(SJV_b2',2);
Vamp_c = data(SJV_c2',2);
Vamp_d = data(SJV_d2',2);
Vamp_e = data(SJV_e2',2);

Vees_a2 = data(SJV_a2',7);
Vees_b2 = data(SJV_b2',7);
Vees_c2 = data(SJV_c2',7);
Vees_d2 = data(SJV_d2',7);
Vees_e2 = data(SJV_e2',7);

SJV_index = find(data(:,2)==0.001&data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,6)==25);
SJV = data(SJV_index',5);
ess_SJV = data(SJV_index',7);

SJC_a1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==10);
SJC_b1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==13);
SJC_c1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==15);
SJC_d1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==17);
SJC_e1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==20);
SJC_f1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==21);
SJC_g1 = find(data(:,2)==0.001&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);

SCtem_a = data(SJC_a1',1);
SCtem_b = data(SJC_b1',1);
SCtem_c = data(SJC_c1',1);
SCtem_d = data(SJC_d1',1);
SCtem_e = data(SJC_e1',1);
SCtem_f = data(SJC_f1',1);
SCtem_g = data(SJC_g1',1);

SCees_a1 = data(SJC_a1',7);
SCees_b1 = data(SJC_b1',7);
SCees_c1 = data(SJC_c1',7);
SCees_d1 = data(SJC_d1',7);
SCees_e1 = data(SJC_e1',7);
SCees_f1 = data(SJC_f1',7);
SCees_g1 = data(SJC_g1',7);

SJC_a2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==10);
SJC_b2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==13);
SJC_c2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==15);
SJC_d2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==17);
SJC_e2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==20);
SJC_f2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==21);
SJC_g2 = find(data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300&data(:,6)==25);

SCamp_a = data(SJC_a2',2);
SCamp_b = data(SJC_b2',2);
SCamp_c = data(SJC_c2',2);
SCamp_d = data(SJC_d2',2);
SCamp_e = data(SJC_e2',2);
SCamp_f = data(SJC_f2',2);
SCamp_g = data(SJC_g2',2);

SCees_a2 = data(SJC_a2',7);
SCees_b2 = data(SJC_b2',7);
SCees_c2 = data(SJC_c2',7);
SCees_d2 = data(SJC_d2',7);
SCees_e2 = data(SJC_e2',7);
SCees_f2 = data(SJC_f2',7);
SCees_g2 = data(SJC_g2',7);

SJC_index = find(data(:,2)==0.001&data(:,1)==25&data(:,3)==1.5&data(:,4)==0.4&data(:,5)==300);
SJC = data(SJC_index',6);
ess_SJC = data(SJC_index',7);




