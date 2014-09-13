%Function VRCEPS: Full RCEPS-cepstrum computation into matrix.
%
%Usage: ceps=vrceps(s[,channels,cp,wlen,wstep,wind]);
%
%Fixed input parameter:
%  s         - signal vector/matrix
%              (particular channels are in columns)
%
%Optional parameters:                                       <Default values>
%  channels  - number of channels                              <according s>
%  cp        - number of cepstral coeficients (without c(0))            <10>
%  wlen      - length of signal frame (window)                         <256>
%  wstep     - length of segmentation step                          <wlen/2>
%  wind      - vector of weighting window           <Hamming window of wlen>                         
%
%Output:
%  ceps      - matrix with values of frame cepstra ordered as
%     c1[0],c1[1],...,c1[cp],   c2[0],c2[1],...,c2[cp],  c3,    c4,      .....
%       :     :         :         :     :         :       :      :
%       :     :         :         :     :         :       :      :
% i.e.     1-st channel     ,        2-nd channel     , 3-rd, 4-th,      .....

%                               Made by PP
%                              29 March 2010
%                         CVUT FEL K331, Prague

function ceps=vrceps(s,channels,cp,wlen,wstep,wind);

ssize=size(s);

if nargin==1,
  channels=ssize(2);
  cp=10;
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
elseif nargin==2,
  cp=10;
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
elseif nargin==3,
  wlen=256;
  wstep=wlen/2;
  wind=hamming(wlen);
elseif nargin==4,
  wstep=wlen/2;
  wind=hamming(wlen);
elseif nargin==5,
  wind=hamming(wlen);
elseif nargin>6,
  disp('??? Too many input parameters!');
end;

slen=length(s(:,1)) ;
wnum=floor((slen-wlen)/wstep)+1;

for j=1:channels,

  eval(['cc' int2str(j) '=[];']);
  for i=1:wnum,
    frame=s(1+(i-1)*wstep:wlen+(i-1)*wstep,j);
    frame=frame.*wind(:);
    

    c=rceps(frame);
    c=c(1:cp+1);
    c=c(:)';

    eval(['cc' int2str(j) '=[cc' int2str(j) '; c];']);
  end;

end;


ceps=[];
for j=1:channels,
  eval(['ceps=[ceps cc' int2str(j) '];']);
end;

