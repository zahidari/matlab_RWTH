function [kf] = kontainerSort(objMotor,kontainerFarbe)

    power = -30;
    kf =  kontainerFarbe;
    if(kontainerFarbe ~= 2 && farbe == 2)%fur blau
        if(kontainerFarbe == 3)
            objMotor.power = +power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;
            kf = 2;
        elseif(kontainerFarbe == 4)
            objMotor.power = -power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;
            kf = 2;
        end
        
    elseif(kontainerFarbe ~= 3 && farbe == 3)%fur grun
        if(kontainerFarbe == 2)
            objMotor.power = -power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;
            kf = 3;
        elseif(kontainerFarbe == 4)
            objMotor.power = +power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;
            kf = 3;
        end
        
    elseif(kontainerFarbe ~= 4 && farbe == 4)%fur gelb
        if(kontainerFarbe == 2)
            objMotor.power = +power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;
            kf = 4;
        elseif(kontainerFarbe == 3)
            objMotor.power = -power;
            pause(0.1);
            objMotor.start;
            objMotor.waitFor;   
            kf = 4;
        end
    end
   
    pause(0.1);
end