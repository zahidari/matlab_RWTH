%% Lichtsensor-Versuch - Sensor timergesteuert auslesen
function lightReadWithTimer(brickObj, numberOfSeconds)

% ... Initialisierung der Vektoren, Starten der Stoppuhr hierher kopieren ...
% ...

%messungen 2xn matrix mit sensorwerte und messzeitpunkte gespeichert


myUserData.messwerte = [];
myUserData.sekunden = [];

myUserData.brickObj = brickObj;
% Timer-Objekt anlegen und starten\
% ...
t = timer;
t.Period=0.05; 
t.userData = myUserData;
t.ExecutionMode='fixedRate';
t.TimerFcn = @readLightTimerFcn; 


tic;
t.start;

pause(numberOfSeconds);
t.stop;


% Daten aus Timer-Objekt auslesen.

myUserData = get(t, 'UserData');


% Plotten der Ergebnisse hierher kopieren
% ...

figure(1);
plot(myUserData.sekunden,myUserData.messwerte);
xlabel('sekunden');
ylabel('Helligkeit');

figure(2);
zeitdiff = diff(myUserData.sekunden);
mittelwert = mean(zeitdiff);
plot(myUserData.sekunden(1:end-1), zeitdiff);
hold on
yline(mittelwert, 'LineWidth',4);

%--------------------------------------------------------------------------

%%
function readLightTimerFcn (timerObj, event)

% UserData aus Timer-Objekt holen
% ...
    myUserData = get(timerObj, 'UserData');
% Zeit und Sensorwert in Datenstruktur speichern:
% Schleifeninhalt der while-Schleife aus lightReadWithLoop hierher kopieren
% ...
    
    myUserData.messwerte(end+1)=   myUserData.brickObj.sensor4.value;
    myUserData.sekunden(end+1)=   toc;
    

% Daten zurueck in Timer-Objekt sichern
% ...
    set (timerObj,'UserData', myUserData);
    
%--------------------------------------------------------------------------

