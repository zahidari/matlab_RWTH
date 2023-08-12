function touchPlot(nominalval_vector,actualval_vector,switchstate_vector)
% Ausgabe der Ergebnisse von der GUI "touchGUI"
% Eingabewerte:
%   nominalval_vector: speichert die Sinuswelle
%   actualval_vector: speichert alle vorherigen Y-Werte (der letzte Eintrag
%   ist die letzte Y-Position)
%   switchstate_vector: speichert die Schalterzustaende des NXT Tastsensors


%% Variablen
x_values = 1:length(nominalval_vector);  % Vektor der x-Werte

%% Bearbeitung des Codes ab hier:


screenSize = get(0,'ScreenSize');
screenW = screenSize(3);
screenH = screenSize(4);

figure('position', [screenW/4, screenH/4, screenW/2,screenH/2]); 

plot(x_values,actualval_vector,x_values,nominalval_vector);
hold on;



ylabel('Y-Werte','FontSize', 12);
xlabel('X-Werte','FontSize',12);



title('Soll- und Istwert','FontSize' ,15);

movegui(gcf,'center');


axis([0,length(x_values),-0.5,1.5]);

%legend()

end