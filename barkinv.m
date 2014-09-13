function f=barkinv(barkf);
%
% BARK: Conversion from Bark frequecy scale into linear one
%
% Usage:  f=barkinv(barkf) ;
%
% Input parameter:
%   barkf     .... frequency in Bark (vector or scalar)
% Output parameter:
%   f         .... frequency in Hz (vector or scalar)

f=600*sinh(barkf./6);
