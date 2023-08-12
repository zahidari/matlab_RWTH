function [values] = soundsensor

b = EV3();
b.connect('usb');
%schallsensor initaliesierung
b.sensor1.mode=DeviceMode.NXTSound.DB;
val=[]; 

for k =  1:100
    
    val(k) = b.sensor1.value;

end
values = val;

b.disconnect;
end

