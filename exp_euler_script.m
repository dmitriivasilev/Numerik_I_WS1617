function exp_euler_script
% Universität Tübingen, WS16/17, Numerik I (Prof. Dr. Christian Lubich)
% Programmierungsaufgabe 6.b)
%
% Die Funktion löst mit Hilfe von 6.a) das Anfangswertproblem für
% f(t,x) = [4, -1; -1, 4] * x auf dem Intervall [0,1] mit Anfangswertbedingung x0 = [1;2].
% In der Zeichnung wird log des Fehlers der Approximationslösungen
% dargestellt für sinnvolle tau. Dieser wird mit log von
% g(x)=x verglichen, um die Konvergenzordnung des Verfahrens herauszulesen.
% Im Plot wird ersichtlich, dass mit abnehmendem tau die Losung des
% expliziten Euler-Verfahrens genauer wird (Fehler in Bezug zu exakter
% Losung wird kleiner). Es ist bekannt, dass log(x) Kovergenzordnung 1 hat. 
% Im vergleich zu log des Fehlers wird ersichtlich, dass dieser auch 
% Konvergenzordnung 1 besitzt.
% Input:
% nichts
%
% Output:
% nichts
%
% Von: Eva Zymelka: eva.zymelka@student.uni-tuebingen.de
%      Jakub Sowula: jakub.sowula@student.uni-tuebingen.de
%      Dmitrii Vasilev: dmitrii.vasilev@student.uni-tuebingen.de
%
% Datum: 22.01.17

% Bestimme die exakte Lösung
exakt = expm([4, -1; -1, 4]) * [1;2];

% Gebe die Funktion f ein
f = @(t,x) [4, -1; -1, 4] * x;

% Wahl der sinnvollen tau
taus = [0.5; 0.1; 0.05; 0.01; 0.005; 0.001; 0.0005; 0.0001; 0.00005];

% Erstelle leere Matrizen für Lösungsvektoren der verschiedenen tau und
% deren Fehlerwerte bzgl. der exakten Lösung
B = zeros(2, length(taus));

F = zeros(1, length(taus));

    for i = 1:length(taus)
    
    B(:,i) = exp_euler(f, [1;2], 0, 1, taus(i));
% Benutze Norm zur Fehlerberechnung
    F(i) = norm(exakt) - norm(B(:,i));
    end


clf
loglog(taus,F, '-s')
hold on
loglog(taus,taus,'--')
title('Zuordnung des log des Fehlers zu jeweiligem log der Schrittweite')
legend('log von Fehler (Normendifferenz)', 'log(x) mit Konvergenzordnung 1')
legend('Location','southeast')
hold off



end