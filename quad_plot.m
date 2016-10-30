function quad_plot(a,b)
% Universität Tübingen, WS16/17, Numerik I (Prof. Dr. Christian Lubich)
% Programmierungsaufgabe 1.b)
%
% Diese Funktion approximiert den Wert des Integrals der Funktion F
% definiert durch f = @(x) cos(x)*exp(sin(x)) mit allen
% Approximationsmethoden aus Aufgab 1.a). Die Funktion zeigt Matrizen der
% Ergebnisse der Approximationen (Spalten stehen für Methoden in dieser
% Reihe 'RR','RL','MR','TR','SR') und Matrix des Fehlers an. Das Bild zeigt
% die Abhängigkeit des Fehlers von Intervalllängen.
%
% Input:
% a - Untere Gränze des Intervals
% b - Obere Gränze
%
% Output: nichts
%
% von: Dmitrii Vasilev
% Matrikelnummer: 3875096
% Datum: 30.10.16

% a - Untere Gränze des Intervals
% b - Obere Gränze

% Erweite die Dezimallänge der Ergebnisse
format long

% Exaktwert des Integrals
ew = exp(sin(b)) - exp(sin(a));

% Function handle der Funktion aus der Aufgabe b)
f = @(x) cos(x)*exp(sin(x));

% Generiere Cell Array mit Approximationsmethoden
met={'RR','RL','MR','TR','SR'};

% Array von Zerlegungen
ti = [2^1,2^2,2^3,2^4,2^5,2^6];

% Definiere Intervalllänge
h = (b-a)./ti;

% Generiere leeren Matrizen für zukunftlichen Ergebnisse und zugehörigen
% Fehler verschiedener Approximationsmethoden
erg = zeros(6,5);
err = zeros(6,5);

% Loop durch Methoden-Array
for k=1:length(met)
    
    % Loop durch Zerlegungen   
    for i=1:length(ti)
       
        % Einfülle die leere Matrizen mit Ergebnisse und Fehler
        erg(i,k) = quadratur(a,b,ti(i),f,met{k});
        % Definiere Fehler als Abstand des Ergebnisses von
        % Approximationswert
        err(i,k) = abs(ew - erg(i,k));
        
    end
    
    
end

erg
err
clf

% Plot die Fehler und Funktionen 1/10*x, x^3 mit Funktionswert h
for i = 1:length(met)
loglog(h,err(:,i),'-s')
hold on
end

loglog(h,1/10*h,'-.')
hold on

loglog(h,h.^3,'--')
hold on

legend('RR','RL','MR','TR','SR','1/10*x','x^3')

title('Abhängigkeit des log des Fehlers von log der Intervalllänge')

xlabel('log(h)')
ylabel('log(Error)')

% Auf dem Diagramm können wir die Abhängigkeit des Fehlers von
% Intervalllänge beobachten. Man sieht auf dem Bild, das mit Erweiterung der
% Intervalle wächst der Fehler. Im Vergleich mit x/10 und x^3 man kann
% sehen, dass Fehler der Rechtecksregel wächst linear. Im anderen Fall mit 
% Simpsonregel Fehlerwachstum sieht mehr als x^3 aus. Mann kann auch
% beobachten, dass mit erweternden Integrationsgränzen (z.B. [0,100])
% Fehlersrate für alle Methoden fast gleich bleibt.

end