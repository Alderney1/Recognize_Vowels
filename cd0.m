%Function CD0: Cepstral distance between two spectra using cepstral coefficients.
%              !!!   WITH THE COEFFICIENT C[0]   !!!
%
%Usage: D=cd0(c1,c2,p);
%  c1  - vector of cepstral coefficients of the first spectrum
%  c2  - vector of cepstral coefficients of the second spectrum
%  p   - number of cepstral coefficients  (without c[0])
%                                             <minimum of length(c1),length(c2)>

%                   Made by Petr Pollak,  28.5.1994

function D=cd0(c1,c2,p);

if nargin<3,
  p=min([length(c1) length(c2)])-1;
elseif  p<min([length(c1) length(c2)]),
  p=min([length(c1) length(c2)])-1;
end;


D=4.3429*sqrt ( (c1(1)-c2(1))^2 + 2*sum((c1(2:p+1)-c2(2:p+1)).^2));
