function clapsensor()
% open a new object
ev3_obj=EV3();
ev3_obj.connect('usb','beep','on');

% set mode to dB
ev3_obj.sensor1.mode = DeviceMode.NXTSound.DB;

% clap detection threshold
clapThreshold = 10;
numSamples = 15;

% initialize sample array and state of lamps
values = zeros(numSamples, 1);
changes = zeros(numSamples - 1, 1);
states = [0 0 0];

% initially, create the figure without data, all lamps off
plot_handles = []; % will be initiliazed by clapsensorPlot
plot_handles = clapsensorPlot(plot_handles, values, values, [0 0 0], 0);

max_iterations = 50;
iterations = 0;

while iterations < max_iterations  && isvalid(plot_handles.h_fig)
% start loop
    iterations = iterations + 1;
    
    % get a new sample from the sensor    
    s =  ev3_obj.sensor1.value;
    
    
    
    % throw away oldest sample and add the new one at the end
    if( iterations <= 15)
        values(iterations) = s;
    else
        values(1:end-1) = values(2:end);
        values(end)=s;
    end
    %values = [values(2:end);s];
   
    % 2 if, states andern, prüfen ob
    if(s>clapThreshold)
        if(states(1) == 0)
            states(1) = 1;
        else
            states(1) = 0;
        end
    
    end
    
    changes = diff(values);
    
    
    
    
    
    

    % display plot and lamps
    clapsensorPlot(plot_handles, values, changes, states, clapThreshold);
    
    % wait 10ms between samples
    pause(0.01);
end

% close object
ev3_obj.disconnect();
end
