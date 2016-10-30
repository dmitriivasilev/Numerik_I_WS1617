%% Universität Tübingen, WS16/17, Numerik I (Prof. Dr. Christian Lubich)
% Programmierungsaufgabe 1.
% Geschrieben bei: Dmitrii Vasilev, Matrikelnummer 3875096, am 29.10.2016.

%% Achtung! Die funktion f würde im Voraus durch Anonyme Funktion (function handle) eingegeben,
% z.B. f = @(x)(x^2) + 5 oder f = @(x)sin(x).


function s = quadratur(a,b,N,f,regel)
% a - Untere Gränze des Intervals
% b - Obere Gränze
% N - Anzahl der Teilintervallen
% f - Funktion zum Integrieren
% Bitte Approximationsregel mit einem String eingeben:
% 'RL' = Rechtecksregel (Funktionswert wird von der linken Seite berechnet)
% 'RR' = Rechtecksregel (Funktionswert wird von der rechten Seite berechnet)
% 'MR' = Mittelpunktsregel
% 'TR' = Trapezregel
% 'SR' = Simpsonsregel
                       
%Sei "s" unsere Integralsumme. Um sicher zu sein, definiere s = 0 am Anfang.
s = 0;

% Zerlege interval [a,b] mit MatLab Funktion linspace zwischen N+1 Punkte,
% um N Intervale zu bekommen:
x = linspace(a,b,N+1);

% Definiere Länge des einzelnen Intervals (anwende abs, falls b<a eingegeben ist)):
h = abs(b-a)/N;

% Berechne die Integralsumme mit verschiedenen Approximationsmethoden. Formeln sind vom
% Mitschrieb während der Vorlesung genommen.

    if regel == 'RR'

      for i=1:N
          s = s + f(x(i+1))*h;
      end
      
    elseif regel == 'RL'
        for i=1:N
            s = s + f(x(i))*h;
        end
        
    elseif regel == 'MR'
        
      for i=1:N
          s = s + f((x(i)+x(i+1))/2)*h;
      end
      
    elseif regel == 'TR'
        
      for i=1:N
          s = s + (f(x(i)) + f(x(i)+h))*(h/2);
      end
    
    elseif regel == 'SR'
        for i=1:N
            s = s + (f(x(i)) + 4 * f(x(i) + (h/2)) + f(x(i)+ h)) * (h/6);
        end
      
      
    end

% Falls man Punkte der Zerlegung und Länge des Intervals anschauen will, bitte uncomment.
% x
% h
end