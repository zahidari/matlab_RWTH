%% Lichtsensor-Versuch - Sensor in Schleife auslesen
function lightReadWithLoop(brickObj, messenInSekunden)

% hier wird keine Initialisierung des Sensors benoetigt!

% Initialisierung der Vektoren, Start der Stoppuhr
% ...

startTime = tic;


% In einer Schleife für die angegebene Anzahl an Sekunden messen
% ...

myUserData.messungen = [];
k = 1;
tic;

while toc(startTime) < messenInSekunden
    myUserData.messungen(1,k) =   brickObj.sensor4.value;
    myUserData.messungen(2,k) =    toc;
    k =k + 1;
end


zeitdiff = diff(myUserData.messungen(2,:));
mittelwert = mean(zeitdiff);

% Plotten der Ergebnisse
% ...
figure(1);
plot(myUserData.messungen(2,:),myUserData.messungen(1,:));
figure(2);
plot(myUserData.messungen(2,1:end-1), zeitdiff);
hold on
yline(mittelwert, 'LineWidth',4);

%plot(myUserData.messungen(2,:), mittelwert ,'g');
hold off