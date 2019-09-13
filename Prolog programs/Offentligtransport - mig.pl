% Offentlig transport                   linje_h
%                                         .
%                                    københavn
%                                      ||
%                 linje_stenløse       ||
%                       .        østerport
%                   Gundsømagle       ||
%                       ||           ||
%                     ||             ||
%----jyllinge---margretheskolen---roskilde . linje_hundige
%      ||            ||
%        ||        ||
%          Stenløse
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
connected(stenløse,margretheskolen,linje_stenløse).
connected(margretheskolen,gundsømagle,linje_stenløse).
connected(roskilde,østerport,linje_h).
connected(østerport,københavn,linje_h).
connected(jyllinge,stenløse,linje_frederiksund).
connected(stenløse,frederiksund,linje_frederiksund).
connected(frederiksund,kronborg,linje_b).
connected(kronborg,dyrehaven,linje_b).


% nearby stations are defined by: if two station are on the same line
% and on more then one station apart, they are nearby stations.
%

nearby(jyllinge,margretheskolen).
nearby(jyllinge,roskilde).
nearby(jyllinge,stenløse).
nearby(jyllinge,frederiksund).
nearby(stenløse,frederiksund).
nearby(stenløse,margretheskolen).
nearby(stenløse,gundsømagle).
nearby(roskilde,østerport).
nearby(roskilde,københavn).
nearby(frederiksund,kronborg).
nearby(frederiksun,dyrehaven).

%
%reachable is when a station i within two stations reach
%
reachable(københavn,østerport).
reachable(københavn,roskilde).
reachable(københavn,margretheskolen).
reachable(østerport,københavn).
reachable(østerport,roskilde).
reachable(østerport,margretheskolen).
reachable(østerport,gundsømagle).
reachable(østerport,jyllinge).
reachable(østerport,stenløse).
reachable(roskilde,østerport).
reachable(roskilde,københavn).
reachable(roskilde,margretheskolen).
reachable(roskilde,gundsømagle).
reachable(roskilde,jyllinge).
reachable(roskilde,stenløse).
reachable(roskilde,frederiksund).
reachable(margretheskolen,roskilde).
reachable(margretheskolen,østerport).
reachable(margretheskolen,københavn).
reachable(margretheskolen,gundsømagle).
reachable(margretheskolen,jyllinge).
reachable(margrehteskolen,stenløse).
reachable(margretheskolen,frederiksund).
reachable(margretheskolen,kronborg).
reachable(gundsømagle,margretheskolen).
reachable(gundsømagle,jyllinge).
reachable(gundsøamgle,stenløse).
reachable(gundsømagle,frederiksund).
reachable(gundsøamgle,roskilde).
reachable(gundsømagle,østerport).
reachable(jyllinge,margretheskolen).
reachable(jyllinge,gundsøamgle).
reachable(jyllinge,roskilde).
reachable(jyllinge,østerport).
reachable(jyllinge,stenløse).
reachable(jyllinge,frederiksund).
reachable(jyllinge,kronborg).
reachable(stenløse,frederiksund).
reachable(stenløse,kronborg).
reachable(stenløse,dyrehaven).
reachable(stenløse,jyllinge).
reachable(stenløse,margretheskolen).
reachable(stenløse,roskilde).
reachable(stenløse,østerport).
reachable(frederiksund,kronborg).
reachable(frederiksund,dyrehaven).
reachable(frederiksund,stenløse).
reachable(frederiksund,jyllinge).
reachable(frederiksund,margretheskolen).
reachable(frederiksund,gundsømagle).
reachable(frederiksund,roskilde).
reachable(kronborg,dyrehaven).
reachable(kronborg,frederiksund).
reachable(kronborg,stenløse).
reachable(kronborg,jyllinge).
reachable(kronborg,margretheskolen).
reachable(dyrehaven,kronborg).
reachable(dyrehaven,frederiksund).
reachable(dyrehaven,stenløse).


%rules
% X anad y are station, L is line
%
nearby(X,Y):-connected(X,Z,L),connected(Z,Y,L).
reachable_station(X,Y):-connected(X,Z,L),reachable(Z,Y).

reachable_route(X,Y,[Z|R]):-connected(X,Z,L),
                      reachable(Z,Y,R).
