% Offentlig transport                   linje_h
%                                         .
%                                    k�benhavn
%                                      ||
%                 linje_stenl�se       ||
%                       .        �sterport
%                   Gunds�magle       ||
%                       ||           ||
%                     ||             ||
%----jyllinge---margretheskolen---roskilde . linje_hundige
%      ||            ||
%        ||        ||
%          Stenl�se
%              ||
%                ||
%              frederiksund---kronborg---dyrehaven . linje_b
%                    .
%                  linje_frederiksund
%



%
% specifies which stations are directly connected by which lines
%  X,Y,L    -> X and Y are stations L are the line

connected(jyllinge,margretheskolen,linje_hundige).
connected(margretheskolen,roskilde,linje_hundige).
connected(stenl�se,margretheskolen,linje_stenl�se).
connected(margretheskolen,gunds�magle,linje_stenl�se).
connected(roskilde,�sterport,linje_h).
connected(�sterport,k�benhavn,linje_h).
connected(jyllinge,stenl�se,linje_frederiksund).
connected(stenl�se,frederiksund,linje_frederiksund).
connected(frederiksund,kronborg,linje_b).
connected(kronborg,dyrehaven,linje_b).


% nearby stations are defined by: if two station are on the same line
% and on more then one station apart, they are nearby stations.
%

nearby(jyllinge,margretheskolen).
nearby(jyllinge,roskilde).
nearby(jyllinge,stenl�se).
nearby(jyllinge,frederiksund).
nearby(stenl�se,frederiksund).
nearby(stenl�se,margretheskolen).
nearby(stenl�se,gunds�magle).
nearby(roskilde,�sterport).
nearby(roskilde,k�benhavn).
nearby(frederiksund,kronborg).
nearby(frederiksun,dyrehaven).

%
%reachable is when a station i within two stations reach
%
reachable(k�benhavn,�sterport).
reachable(k�benhavn,roskilde).
reachable(k�benhavn,margretheskolen).
reachable(�sterport,k�benhavn).
reachable(�sterport,roskilde).
reachable(�sterport,margretheskolen).
reachable(�sterport,gunds�magle).
reachable(�sterport,jyllinge).
reachable(�sterport,stenl�se).
reachable(roskilde,�sterport).
reachable(roskilde,k�benhavn).
reachable(roskilde,margretheskolen).
reachable(roskilde,gunds�magle).
reachable(roskilde,jyllinge).
reachable(roskilde,stenl�se).
reachable(roskilde,frederiksund).
reachable(margretheskolen,roskilde).
reachable(margretheskolen,�sterport).
reachable(margretheskolen,k�benhavn).
reachable(margretheskolen,gunds�magle).
reachable(margretheskolen,jyllinge).
reachable(margrehteskolen,stenl�se).
reachable(margretheskolen,frederiksund).
reachable(margretheskolen,kronborg).
reachable(gunds�magle,margretheskolen).
reachable(gunds�magle,jyllinge).
reachable(gunds�amgle,stenl�se).
reachable(gunds�magle,frederiksund).
reachable(gunds�amgle,roskilde).
reachable(gunds�magle,�sterport).
reachable(jyllinge,margretheskolen).
reachable(jyllinge,gunds�amgle).
reachable(jyllinge,roskilde).
reachable(jyllinge,�sterport).
reachable(jyllinge,stenl�se).
reachable(jyllinge,frederiksund).
reachable(jyllinge,kronborg).
reachable(stenl�se,frederiksund).
reachable(stenl�se,kronborg).
reachable(stenl�se,dyrehaven).
reachable(stenl�se,jyllinge).
reachable(stenl�se,margretheskolen).
reachable(stenl�se,roskilde).
reachable(stenl�se,�sterport).
reachable(frederiksund,kronborg).
reachable(frederiksund,dyrehaven).
reachable(frederiksund,stenl�se).
reachable(frederiksund,jyllinge).
reachable(frederiksund,margretheskolen).
reachable(frederiksund,gunds�magle).
reachable(frederiksund,roskilde).
reachable(kronborg,dyrehaven).
reachable(kronborg,frederiksund).
reachable(kronborg,stenl�se).
reachable(kronborg,jyllinge).
reachable(kronborg,margretheskolen).
reachable(dyrehaven,kronborg).
reachable(dyrehaven,frederiksund).
reachable(dyrehaven,stenl�se).


%rules
% X anad y are station, L is line
%
nearby(X,Y):-connected(X,Z,L),connected(Z,Y,L).
reachable_station(X,Y):-connected(X,Z,L),reachable(Z,Y).

reachable_route(X,Y,[Z|R]):-connected(X,Z,L),
                      reachable(Z,Y,R).
