function [] = A3p1b()


% power 30 um 1000 grad drechen. 
b = EV3();
b.connect('usb');

b.motorA.limitValue = 1000;
b.motorA.brakeMode = 'Coast';

b.motorA.power = 30;
b.motorA.start;
b.motorA.waitFor;

%power 50
b.motorA.power = 50;
b.motorA.start;
b.motorA.waitFor;

%power 70
b.motorA.power = 70;
b.motorA.start;
b.motorA.waitFor;

%IsRunning
%tic toc 6 sec
%ein plot mit einer wineklgerad von 1000, isrunning
%lengende











b.disconnect;