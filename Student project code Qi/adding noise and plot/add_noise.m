%{
The code in this section mainly selects suitable data (350 groups)
from 500 groups of data to add noise, uses the function normrnd() 
to randomly select noise from the Gaussian distribution with 
specified mean and std to add to the data, and draws a scatter plot 
to show the change of the data after adding noise.
Variable Meaning:
PCB, chip, SJV, mix: Data to be added to the noise
R1, R2, R3, mix_R1, mix_R2, mix_R3: Gaussian noise
noise_PCB, noise_chip, noise_SJV, noise_mix: Data after adding Gaussian noise
%}
load('data') %Importing Data

%Select the data to be added to the noise
PCB = data(1:100, :);
chip = data(171:270, :);
SJV = data(351:450, :);
mix = data([82:93 196:202 318:348 ],:);

% Set random number seed
rng(1);

% Adding PCB Noise
R1 = normrnd(0, 0.07, 1, 100); %Gaussian noise, specifying its mean and std and quantity
PCB_vakue = PCB(:,3);
PCB_vakue_with_noise = PCB_vakue + R1';
noise_PCB = [PCB(:,1:2) PCB_vakue_with_noise PCB(:,4:7)];
%save
save('noise_PCB');

%plot scatter
figure(1)
x = [1:1:100];
scatter(x,PCB_vakue,[],'b','+');hold on;
scatter(x,PCB_vakue_with_noise,[],'r','o','filled');
hold off;
legend('initial','with noise');
xlabel('count');
ylabel('PCB thickness [mm]');

% Adding chip Noise
R2 = normrnd(0, 0.03, 1, 100);
chip_vakue = chip(:,4);
chip_vakue_with_noise = chip_vakue + R2';
noise_chip = [chip(:,1:3) chip_vakue_with_noise chip(:,5:7)];
save('noise_chip')

%plot scatter
figure(2)
x = [1:1:100];
scatter(x,chip_vakue,[],'b','+');hold on;
scatter(x,chip_vakue_with_noise,[],'r','o','filled');
hold off;
legend('initial','with noise');
xlabel('count');
ylabel('chip thickness [mm]');

% Adding SJV Noise
R3 = normrnd(0, 10, 1, 100);
SJV_vakue = SJV(:,5);
SJV_vakue_with_noise = SJV_vakue + R3';
noise_SJV = [SJV(:,1:4) SJV_vakue_with_noise SJV(:,6:7)];
save('noise_SJV')

%plot scatter
figure(3)
x = [1:1:100];
scatter(x,SJV_vakue,[],'b','+');hold on;
scatter(x,SJV_vakue_with_noise,[],'r','o','filled');
hold off;
legend('initial','with noise');
xlabel('count');
ylabel('SJ volume [μm]');


% Adding mix Noise
mix_R1 = normrnd(0, 0.07, 1, 50);
mix_R2 = normrnd(0, 0.03, 1, 50);
mix_R3 = normrnd(0, 10, 1, 50);
mix_1 = mix(:,3);
mix_2 = mix(:,4);
mix_3 = mix(:,5);
mix_1_with_noise = mix_1 + mix_R1';
mix_2_with_noise = mix_2 + mix_R2';
mix_3_with_noise = mix_3 + mix_R3';
noise_mix = [mix(:,1:2) mix_1_with_noise mix_2_with_noise mix_3_with_noise mix(:,6:7)];
save('noise_mix')
