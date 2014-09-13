function c=a2c0(a,alpha,p,cp);

%Function A2C0: Computation of cepstral coeficients from AR coeficients.
%
%Usage: c=a2c0(a,alpha,p,cp);
%   a   - vector of AR coefficients ( without a[0] = 1 )
%   p   - order of AR model ( number of coefficients without a[0] )
%   alpha - square error of forward prediction
%   c   - vector of cepstral coefficients ( with c[0] )
%   cp  - order of cepstral model ( number of coefficients without c[0] )

c=a2c(a,p,cp);
 
c=[2*log(sqrt(alpha)) c];
