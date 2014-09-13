function Wplp=plpbf(fs,N);

%
% PLPBF: PLP bank weights for DFT evaluation
%
% Usage: Wplp=plpbf(fs,N) ;
%
% Input parameters:
%   fs        .... sampling frequency
%   N         .... points of DFT
% Output parameter:
%   Wplp      .... M-(N/2+1) matrix with filter bank weigths
%    ( M      .... number of bands - depends on fs )       

if nargin<1,
  fs=16000;
end

if nargin<2,
  N=512;
end

ff=(0:N/2).*fs./N;
barkff=bark(ff) ;

M=floor(bark(fs/2));
Wplp=zeros(M+1,N/2+1);

barkpoints=0:M;

for ii=0:M,

  b=barkff-ii;
  mask0=( b <= 0.5 & b > -0.5);
  mask1= 10.^(2.5*(b+0.5)).*( b <= -0.5 & b > -1.3);
  mask2= 10.^(-(b-0.5)).*( b >= 0.5 & b < 2.5);
  
  f=barkinv(ii);
  jf = j*f 
  % amp = ( f^2 + 1.44e6)*f^4/((f^2+1.6e5)^2)/(f^2+9.63e6) ;
  % amp = ((ww^2+56.9e6)*ww^4)/((ww^2+6.3e6)^2)/(ww^2+379.4e6)/(ww^6+9.6e26) ;  %psutka
   amp = abs( jf^2*(1+jf/1200)/((1+jf/400)^2)/(1+jf/3100)/((1+jf/5000)^3) ) 

  Wplp(ii+1,:) = ((mask0+mask1+mask2).*amp) ;

end

  Wplp = Wplp ./ max(max(Wplp)) ;

if nargout==0,
  figure(1) ;
  plot(Wplp')
  grid
end




