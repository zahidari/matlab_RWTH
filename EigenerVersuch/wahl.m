function [] = wahl()
ev3 = EV3;
ev3.connect('usb');
ev3.beep;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% befor man programm startet, bitte die motoren und sesnoren ueberpruefen

bandMotor     = ev3.motorA;
sortierMotor  = ev3.motorB;
kontainerMotor  = ev3.motorC;

farbSensor    = ev3.sensor4;
emergencyStop = ev3.sensor2;

stop = ev3.sensor1;

bandMotor.power = 10;
sortierMotor.limitValue = 120; %120 grad sperre 
sortierMotor.brakeMode = 'brake';
kontainerMotor.limitValue = 120; %120 grad sperre 
kontainerMotor.brakeMode = 'brake';


farbSensor.mode = DeviceMode.Color.Col;

power = -30;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

bandMotor.resetTachoCount;
sortierMotor.resetTachoCount;

gedruckt = 0;
loslassen =1;

winkel= [];
farbe = [];
rot   = 0;
blau  = 0;
grun  = 0;
gelb  = 0;
kontainerFarbe = 2; 

flag1 = 0;
flag2 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% loop
while true
    % stop fur sensor1
    if stop.value == 1
        break;
    end
    
    
    
   if (bandMotor.isRunning == 0) && gedruckt == 0
       bandMotor.start;
   end
    
    if emergencyStop.value == 1 && bandMotor.isRunning == 1 && loslassen == 1
            
            gedruckt = 1;   
       
    elseif emergencyStop.value == 1 && bandMotor.isRunning == 0 &&  loslassen == 1
            
            gedruckt = 0;   
        
    end
     
    loslassen = emergencyStop.value;
    
    
    if bandMotor.isRunning == 1 && gedruckt == 1
            bandMotor.stop;
     end
          
    if sortierMotor.isRunning == 1 && gedruckt == 1
                sortierMotor.stop;
    end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%  
    
    if(flag1 == 0)
        switch farbSensor.value
            case 2
                winkel(end+1) = bandMotor.tachoCount;
                farbe(end+1)  = 2 ;% blau
                kontainerFarbe(end+1) = 2;
                flag1 = 1;
            case 3
                winkel(end+1) = bandMotor.tachoCount;
                farbe(end+1)  = 3; % grun
                kontainerFarbe(end+1) = 3;
                flag1 = 1;
            case 4
                winkel(end+1) = bandMotor.tachoCount;
                farbe(end+1)  = 4; % gelb
                kontainerFarbe(end+1) = 4;
                flag1 = 1;
            case 5
                winkel(end+1) = bandMotor.tachoCount;
                farbe(end+1)  = 5; % rot
                kontainerFarbe(end+1) = 5;
                flag1 = 1;
        end
    end
    
    if(farbSensor.value == 0 || farbSensor.value == 1 )
        flag1 = 0;
    end
    
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%  
    %sortieren
    if length(winkel) ~= 0
        if(length(farbe) ~= 0 )
%%          
            
            if( kontainerFarbe(1) ~= 2 && farbe(1) == 2)%fur blau
                
                if(kontainerFarbe(1) == 3 || kontainerFarbe(1) == 5)
                    kontainerMotor.power = +power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1)= 2;
                    
            
                elseif(kontainerFarbe(1) == 4 || kontainerFarbe(1) == 5)
                    kontainerMotor.power = -power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1)= 2;
                               
                end
        
            elseif(kontainerFarbe(1) ~= 3 && farbe(1) == 3)%fur grun
                if(kontainerFarbe(1) == 2 || kontainerFarbe(1) == 5 )
                    kontainerMotor.power = -power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1)= 3;                    
                    
            
                elseif(kontainerFarbe(1) == 4 || kontainerFarbe(1) == 5)
                    kontainerMotor.power = +power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1)= 3;
                    
                end
        
            elseif(kontainerFarbe(1) ~= 4 && farbe(1) == 4)%fur gelb
                if(kontainerFarbe(1) == 2 || kontainerFarbe(1) == 5)
                    kontainerMotor.power = +power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1)= 4;
                    
                elseif(kontainerFarbe(1) == 3 || kontainerFarbe(1) == 5)
                    kontainerMotor.power = -power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;   
                    kontainerFarbe(1)= 4;
                    
                end
            elseif(kontainerFarbe(1) ~= 2 && farbe(1) == 5) % fur rot
                
                if(kontainerFarbe(1)== 3)
                    kontainerMotor.power = +power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1) = 2;
                
                elseif(kontainerFarbe(1) == 4)
                    kontainerMotor.power = -power;
                    pause(0.07);
                    kontainerMotor.start;
                    kontainerMotor.waitFor;
                    kontainerFarbe(1) = 2;
                end
            end
           
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%     
        temp = winkel(1) + 500;
        if temp <= bandMotor.tachoCount
            
            switch farbe(1)
                case 2 %blau
                    sortierMotor.power = 40;
                    pause(0.07);
                    sortierMotor.start;
                    sortierMotor.waitFor;
                    flag2 = 1;
                    blau = blau +1;
                case 3 %grun
                    sortierMotor.power = 40;
                    pause(0.07);
                    sortierMotor.start;
                    sortierMotor.waitFor;
                    flag2 = 1;
                    grun = grun +1;
                case 4 %gelb
                    sortierMotor.power = 40;
                    pause(0.07);
                    sortierMotor.start;
                    sortierMotor.waitFor;
                    flag2 = 1;
                    gelb =gelb +1;
                case 5 %rot
                    sortierMotor.power = -40;
                    pause(0.07);
                    sortierMotor.start;
                    sortierMotor.waitFor;
                    flag2 = 1;
                    rot = rot +1;
            end
         end
   
       %den ersten wert loschen
       if(flag2 == 1 ) 
            kontainerFarbe = kontainerFarbe (2:end);
            winkel= winkel (2:end);
            farbe = farbe(2:end);
            flag2 = 0;
       end

    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
    
    ev3.disconnect; 
    
end
