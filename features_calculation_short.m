function [Cr, Clpc, Cmfcc]=features_calculation_short(signal,fs)

%short frames

y=loadbin(signal);
Ns=length(y);
x=(1:Ns)/fs;
NFFT=256;

figure(1)
subplot(411)
plot(x,y)

wlen=32e-3*fs;
channels=1;
nb_coef=12;
wstep=wlen/2;
wind=hamming(wlen);

% short time real cepstrum
Cr=vrceps(y,channels,nb_coef,wlen,wstep,wind);

subplot(412)
plot(Cr(92,:))

% LPC
AR_order=16;
Clpc=vaceps(y,channels,AR_order,nb_coef,wlen,wstep,wind);

subplot(413)
plot(Clpc(92,:))

% MFCC
M=30;
fmin=0;
fmax=8000; % usual speech band
Cmfcc=vmfcc(y,channels,nb_coef,M,wlen,fs,fmin,fmax,wstep,wind);

subplot(414)
plot(Cmfcc(92,:))

%PLP

% Bark BF?

end