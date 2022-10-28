%{
This section of the code aims to use the trained ML model 
to make predictions. The input feature values are the first 
to enter, followed by normalization of the feature values, 
and finally, the predicted output values are obtained.
Variable Meaning:
x_predict: features, 
i.e.[temperature,amplitude,PCB thicknee,chip thckness,SJV,SJC]
y_predict: predicted value
%}
load('net')%Importing the neural network and its parameters

x_predict = [];%features
x_predict = mapminmax('apply',x_predict',Xs);
y_predict = sim(net,x_predict);

digits(4);%Rounded to 4 decimal places
y_predict = y_predict/1000 %predicted value
