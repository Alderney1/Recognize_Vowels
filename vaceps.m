%Function VACEPS: Full AR cepstrum computation into matrix.
%                 Burg's or autocorrelation algorithm of AR model computation.
%
%Usage: ceps=vaceps(s[,channels,p,cp,wlen,wstep,wind,artype]);
%
%Fixed input parameter:
%  s         - signal vector/matrix
%
%Optional parameters:                                       <Default values>
%  channels  - number of channels                              <according s>
%  p         - order of AR model                                        <10>
%  cp        - number of cepstral coeficients (without c(0))            <10>
%  wlen      - length of signal frame (window)                         <256>
%  wstep     - length of segmentation step                          <wlen/2>
%  wind      - vector of weighting window           <Hamming window of wlen>                         
%  artype - type of AR model computation                             <yulew>
%           'yulew' ... Yule-Walker sense (Autocorrelation method)
%           'burg'  ... Burg algorithm 
%   
%
%Output:
%  ceps      - matrix with values of frame cepstra ordered as
%     c1[0],c1[1],...,c1[cp],   c2[0],c2[1],...,c2[cp],  c3,    c4,      .....
%       :     :         :         :     :         :       :      :
%       :     :         :         :     :         :       :      :
% i.e.     1-st channel     ,        2-nd channel     , 3-rd, 4-th,      .....
%
%This function call:     aceps, burg, a2c0
% 

%                               Made by PP
%                              29 March 2010
%                         CVUT FEL K331, Prague


function ceps=vaceps(s,channels,p,cp,wlen,wstep,wind,artype);

ssize=size(s);

if nargin==1,
  channels=ssize(2);
  p=10;
  cp=10;
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==2,
  p=10;
  cp=10;
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==3,
  cp=10;
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==4,
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==5,
  wstep=wlen/2;
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==6,
  wind=hamming(wlen);
  artype='yulew';
elseif nargin==7,
  artype='yulew';
elseif nargin>8,
  disp('??? Too many input parameters!');
end;



slen=length(s(:,1)) ;
wnum=floor((slen-wlen)/wstep)+1;

for j=1:channels,

  eval(['cc' int2str(j) '=[];']);
  for i=1:wnum,
    frame=s(1+(i-1)*wstep:wlen+(i-1)*wstep,j);
    frame=frame.*wind(:);

    c=aceps(frame,p,cp,artype);

    eval(['cc' int2str(j) '=[cc' int2str(j) '; c];']);
  end;

end;


ceps=[];
for j=1:channels,
  eval(['ceps=[ceps cc' int2str(j) '];']);
end;


