%Function ACEPS - AR cepstra computation. 
%                 Burg's or autocorrelation algorithm of AR model computation.
%                 !!! NO WINDOWING !!!
%
%Usage: c=aceps(frame[,p,cp,wlen,artype]);                             
%Fixed input parameter:
%  frame  - vector of processed signal  
%
%Optional parameters:                                     <Default values>
%  p      - order of AR model                                         <10>
%  cp     - number of cepstral coefficients (without c(0))            <10>
%  artype - type of AR model computation                           <yulew>
%           'yulew' ... Yule-Walker sense (Autocorrelation method)
%           'burg'  ... Burg algorithm 
%
%Output: 
%  c=[c(0) c(1) ... c(cp)]   -   LPC cepstral ceofficients (ROW VECTOR)
%

%                               Made by PP
%                              29 March 2010
%                         CVUT FEL K331, Prague

function c=aceps(frame,p,cp,artype);

% Optional parameter definition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2,
  p=10;
end;

if nargin<3,
  cp=10;
end;

if nargin<4, 
  artype='yulew';
end;




% AR cepstral coefficient computation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if strcmp(artype,'burg'),
    [a,Ep]=burg(frame,p);
elseif strcmp(artype,'yulew'),
    [a,Ep]=lpc(frame,p);
else
    error(['Value ' artype ' is not allowed parameter of function aceps!' ]);
end
    
    

c=a2c0(a(2:p+1),Ep,p,cp);

c=c(:)'; 