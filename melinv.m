function f=barkinv(barkf);
%
% MELINV: Conversion from mel-frequency scale into linear scale
%
% Usage: f=barkinv(barkf) ;
%
% Input parameter:
%   barkf      .... frequency in mel (vector or scalar)
% Output parameter:
%   f         .... frequency in Hz (vector or scalar)

f=600*sinh(barkf/6);

