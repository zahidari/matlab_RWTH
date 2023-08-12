%% Lichtsensor-Versuch - Sensor auslesen
function brickObj = lightConnectEV3(brickConnectionType, sensorMode)

%% EV3-Verbindung oeffnen
% EV3-Objekt erstellen
brickObj = EV3();
% Verbindung herstellen
if strcmp(brickConnectionType, 'usb')  
  brickObj.connect('usb');
  brickObj.beep;
else
  brickObj.connect('bt', 'serPort', '/dev/rfcomm0');
  brickObj.beep;
end


%lightValue= brickObj.sensorX.value;
%brickObj.sensorX.mode=modeValue; DeviceMode.Color.Ambient , Reflect , Col

%https://de.mathworks.com/matlabcentral/answers/161396-how-do-i-pass-variables-between-timer-callback-functions


%% Lichtsensor initialisieren
%
% Initialisieren Sie den Lichtsensor!

if strcmp (sensorMode, 'ambient')
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % IHR CODE HIER ...
    brickObj.sensor4.mode = DeviceMode.Color.Ambient;
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif strcmp (sensorMode, 'reflect')
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % IHR CODE HIER ...
    brickObj.sensor4.mode = DeviceMode.Color.Reflect;
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
  error('Unbekannter  bei obj.sensor. mode porblem. bitte neu eingeben. sensorMode');
end
















