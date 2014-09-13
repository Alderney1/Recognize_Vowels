function barkf=bark(f);
%
% BARK: Conversion from linear frequency into Bark frequecy scale
%
% Usage:  barkf=bark(f) ;
%
% Input parameter:
%   f         .... frequency in Hz (vector or scalar)
% Output parameter:
%   barkf     .... frequency in Bark (vector or scalar)

barkf=6*log(f./(600)+((f./(600)).^2+1).^0.5);
