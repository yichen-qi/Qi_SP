%{
This section of code aims to build, train and evaluate the neural
network. First 500 sets of simulated data and 350 sets of data 
with noise will be integrated into a new data set, then the inputs 
and outputs will be extracted from these 850 sets of data and the inputs 
will be normalized. The network is built using fitnet(), the parameters
of the network as well as the hyperparameters are determined, 
the network is trained using train(), and finally the accuracy 
and speed of the network is evaluated and plotted.
Variable Meaning:
data: 500 simulation data and 350 data with noise
X,Y: input and output
hiddenlayerSize, net.trainParam.lr :Hyperparameters
Train_Relative_Error : Metrics for neural network evaluation
%}

format long;
load('data') % Importing 500 simulation Data
load('noise_chip') % Importing 100 Data with chip noise
load('noise_mix') % Importing 50 Data with mix noise
load('noise_PCB') % Importing 100 Data with PCB noise
load('noise_SJV') % Importing 100 Data with SJV noise

% Set random number seed
rng(1);

% extract input and output from dataset
data = [data;noise_chip;noise_PCB;noise_SJV;noise_mix];
X = data(:,1:6);% input
Y = data(:,7); % output

% normalize the input in [0.2 0.8]
[Xn,Xs]= mapminmax(X',0.2,0.8);
xt = Xn;
%Increase the output so that the loss is not too 
%small to cause the training to stop early.
yt = Y'*1000;

% build BP network framework
hiddenlayerSize = [5 5];%Number of neurons on the hidden layer
trainFcn = 'trainbr'; % BP function
net = fitnet(hiddenlayerSize, trainFcn);            
net.divideFcn = ''; %No validation dataset and test dataset
net.trainParam.lr = 0.01; %set learning rate


% train the model
tic;%Timer start
[net,tr] = train(net, xt, yt);%train the model   
tr.divideFcn = '' ;   
toc;%Timer end
   
   
   
% evaluation and plot

yTrain = net(xt(:,tr.trainInd));%predicted value * 1000
yTrainTrue = yt(tr.trainInd); %measured value * 1000  
yTrain1 = yTrain/1000; %predicted value
yTrainTrue1 = yTrainTrue/1000;%measured value
%relative error
Train_Relative_Error = abs(yTrain1 -yTrainTrue1)/yTrainTrue1 * 100;

grid on;
figure(1)          
plot(yTrain,yTrainTrue,'x');hold on;
plot(0:4,0:4);hold off;
xlabel('predicted vaule×10^-^3 [%]');
ylabel('measured vaule×10^-^3 [%]');
text(1,3,'Train dataset');
title(['Train Relative Error=',num2str(Train_Relative_Error),'%']);

%save
save('net')



