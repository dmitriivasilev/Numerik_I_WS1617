%%
% Programmiertestat für Dummies.
% In diesem Skript versuche ich Basisoperationen zu sammeln, s.d. jeder
% den Progtestat in Matlab bestehen kann.
%
% Das Skript läuft an sich nicht. Falls Sie ein Beispiel aufrufen wollen,
% dann sondern sie nötige Codelinien ab und drücke F9 (man kann das auch mit Kommentare machen).
% Die Funktionen sollen separat gespeichert werden.
%
% Für Beschwerde und Kommentare schreiben Sie bitte an
% email: dmitrii.vasilev@tuebingen.mpg.de
%
% Von: Dmitrii Vasilev, 25.01.17.
%% Teil 1. Variable.
% Um eine Operation durchzuführen, braucht Rechner etwas, womit er arbeiten
% kann. In unserem Fall das ist eine Variable. Es gibt zwei Hauptarten
% davon: globale und lokale Variable. In unseren Progaufgaben haben wir
% normaleweise die Funktionen als eine globale Variable eingegeben
%
% Beispiel. f(x,y)= cos(x) + y^2
f = @(x,y) cos(x) + y.^2 % das heißt eine Anonyme Funktion oder function handle

% Der Punkt vor dem ^ ist dafür da, dass man als Argument einen Vektor
% wählen kann. Z.B.: Definiere eine Funktion g(x)=x^2 und einen Vektor mit
% Argumenten v. w=g(v) wird dann wieder ein Vektor sein, mit w(i)=g(v(i)):

g = @(x) x.^2
v = [ 1, 2, 3, 4, 5] % so gibt man einen Zeilenvektor ein.
u = [ 1; 2; 3; 4; 5] % so gibt man einen Spaltenvektor ein.
w = g(v)

% Oder so (rufe f von oben auf)
f(g(v),v)

% Man kann auch ein Vektor erweitern:
v = [v, 6]

% Es ist nutzlich zu wissen, wie man alle globale Variablen aus dem Speicher löscht:
clear all

% Weitere Beispiele:
% Definiere einen 1x10 Nullvektor m. Wenn man später einen Vektor einfüllen
% will, es ist eine gute Angewohnheit, den Vektor im Voraus als Nullvektor
% zu definieren:
m = zeros(1,10)

% 7x12 Nullmatrix N:
N = zeros(7,12)

% Fülle eine Matrix A ein und wähle dann erste Spalte
A = [ 1, 3; 2, 4]
A(:,1)

% oder n-te Zeile:
A(2,:)

% Definiere eine zufällige 2 x 5 Matrix B:
B = [rand(2,5)]

%% Teil 2. Funktionen
% In unseren Aufgaben haben wir nur Funktionen geschrieben. Der Unterschied
% zwischen einem Skript und einer Funktion ist folgende: Skript ist nur
% eine Liste von Befehle, die in einer Reihenfolge aufgerufen wird. Alle
% Variablen werden dann als globale Variablen gespeichert,
% was ist nicht so nett. Auf der andere Seite, eine Funktion
% braucht (aber nicht umbedingt) ein Input, und spuckt nur Ouput aus, ohne
% Variablen zu speichern.

% Lass uns eine Funktion für Fakultät schreiben. Die braucht ein input n,
% um n! zu berechnen. Errinerung: die Funktion soll als ein separater
% .m-File gespeichert werden. Dann kann man die Funktion fakul(n) aus
% Command line aufrufen.

function [ a ] = fakul(n)
a = 1;
for i = 1 : n
    a = a * i; % ; Zeichen ist dafür da, dass jede Schritt nicht in der Command line gezeigt wird.
end

%%
% So kommen wir zum Teil 3. For- und while-Schleifen.
% Wie man im Beispiel mit Fakultät sehen kann, haben wir eine for-Schleife
% benutzt. Die soll intuitiv klar sein: man hat eine Indexmenge i={1,2, ... ,n}
% und führt eine Operation in der Reihenfolge von 1 bis n durch.

% Beispiel:
% Definiere einen Nullvektor p und fülle ihn mit log(k) ein, mit k={1,2,3,4,5}

clear all
clc  % clear command line
p = zeros(1,5)
for k = 1 : 5
    p(:,k) = log(k); % Man kann auch für Vektoren p(k) schreiben.
end
p % um neuen Vektor p anzuschauen.
    
% Jetzt können wir kurz eine while-Schleife programmieren. Die Schleife
% wird irgendwelche Operation durchführen, bis eine Bedingung nicht mehr erfüllt
% ist. Z.B.: lass uns zu eine Zahl z = 3 etwas addieren, z.B. 0.3, bis die
% Zahl z größer als e^3 ist.

clear all
clc
z = 3
e = exp(3)
while z < e
    z = z + 0.3;
end
z

% Ich hoffe, dass der Ausdruck z = z + 0.3; ist jedem klar. Aber für
% Sicherheit erkläre ich das mal: die Variable z wurde im Voraus
% eingegeben. Im ersten Kreis der Schleife Matlab vergleicht z und e^3.
% Offensichtlich, 3 < e^3. Dann addiert er 0.3 zum z, und speichert das als
% neues z fur nächste Runde, usw., bis die Bedingung nicht mehr erfüllt
% ist.

% Man kann natürlich mehrere Schleifen kombinieren. Achte drauf, dass jede
% Schleife mit eigenem end beendet sein soll.

% Die Schleife erstellt einen Nullvektor s, und dann einfüllt jeden Eintrag
% s_i mit Summe von 1 bis i.

clear all
clc
s = zeros(1,10)
for i = 1 : length(s) % Größe des Vektors s
    for j = 1 : 0.5 : i % Schrittweite ist normaleweise 1, aber hier habe ich die als 0.5 definiert.
        s(:,i) = s(:,i) + j;
    end
end
s

%% Teil 4. Plots.
% Man soll auch wissen, wie er etwas ploten kann. Hier ist eine kleine
% Illustration:

clear all
close all % Schliesse alle Bilder
clf % clear figure Befehl
f = @(x) exp(x);
g = @(y) log(y) + 1./log(y); % Punkt in ./ ist jetzt wichtig
x = linspace(0,5,100); % Dieser Befehl zerlegt ein Intervall [0,5] in 100 äquidistante Teilintervalle
plot(x,f(x), '-r') % Plot Vektor x gegen Vektor f(x) im rot
hold on % Weitere plots werden auf demselben Bild geplotet
plot(x,g(x), '-b') % Plot Vektor x gegen vektor g(x) im blau
hold off %
xlabel('x') % Nenne x-Achse
ylabel('f(x)') % Nenne y-Achse
title('Kurven von e^x und von log(y) + 1/log(y)') % Nenne Plot an sich
legend('f(x) = e^x','f(x) = log(y) + 1/log(y)') % Gebe eine Legende ein in der Reihenfolge von plot(..)
legend('Location', 'northwest') % Position der Legende