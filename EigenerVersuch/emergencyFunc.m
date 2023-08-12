function [abbrechen, weiter] = emergencyFunc(bandMotor,sortierMotor,emergencyStop)

emergencyGedruckt = 0;
abbrechen= 0;
secWaitForTurnOff  = 3;
weiter = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % wenn man 3 sec emergencystop drueckt, dann wird das Programm beendet. 
 if emergencyStop.value ==1
     %state wechsel
     if emergencyGedruckt == 1
        emergencyGedruckt =0;
     else
        emergencyGedruckt = 1;
     end
        

        if emergencyGedruckt == 1
            bandMotor.stop;
            sortierMotor.stop;
            weiter = 0;
        else
            weiter = 1;
        end
        
        pause(0.5);
        
        % nach paar sekunden ausschalten.
        while emergencyStop.value == 1
            tic;
            if toc > secWaitForTurnOff
                abbrechen = 1;
                break;
            end
        end
 end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
