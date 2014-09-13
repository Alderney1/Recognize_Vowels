%Function CD2: Euclidan distance of two cepstral vectors.
%
%Usage: D=cd2(c1,c2,p);
%  c1  - the first vector of cepstral coefficients 
%  c2  - the second vector of cepstral coefficients  
%  p   - number of cepstral coefficients         <minimum of length(c1),length(c2)>

%                 Made by Petr Pollak, 28.4.1994

function D=cd2(c1,c2,p);

if nargin<3,
  p=min([length(c1) length(c2)]);
elseif  p<min([length(c1) length(c2)]),
  p=min([length(c1) length(c2)]);
end;

c1=c1(1:p);
c2=c2(1:p);

D=sum((c1-c2).^2);
