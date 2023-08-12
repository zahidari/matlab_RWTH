%% Aufgabe Motormessungen
% Template for exercise b) and c)
%function [] = motor_exercise_1bc()

%% Open Bluetooth/USB connetion
%...

b = EV3();
b.connect('usb');




%% Set variables
% ...

b.motorA.limitValue = 1000;
b.motorA.brakeMode = 'brake';
maxMessDauer = 6;


%% Create motor object
% ...

m = b.motorA;
m.resetTachoCount;


%% Do three measurements
% ...
l =1;
for power = [30 50 70]
    k = 1;
    m.waitFor;
    m.resetTachoCount;
    tic;
    m.power = power;
    m.start;
        
    while(toc < maxMessDauer)
        array1 (l,k) = m.isRunning;
        array2 (l,k) = m.tachoCount;
        array3 (l,k) = toc;
        k = k+1;
    end
    num_samples(l)= k-1;
    l = l+1;
    
end



%% Close NXT
% ...

b.disconnect;


%% Display permant motor position differences
% ...
for k = 1:3
array2([k],[num_samples(k)]) -1000
end


%% Plot graphs
% ...
for k = 1:3
    
plot(array3(k,[1:num_samples(k)]),array2([k],[1:num_samples(k)]));
hold on
plot(array3(k,[1:num_samples(k)]),array1([k],[1:num_samples(k)])*500);
end

yline(1000);
%plot([0 6],[1000 1000]);

axis([0,6,0,1500]);
legend('Winkelgrad für 30%','Running für 30%',...
'Winkelgrad für 50%','Running für 50%',...
'Winkelgrad für 70%','Running für 70%');
hold off



