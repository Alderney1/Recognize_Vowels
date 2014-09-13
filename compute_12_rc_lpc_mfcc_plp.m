function [Cr,lpc, mfcc]=compute_12_rc_lpc_mfcc_plp(record,fs,Ns,wlen,channels,nb_coef,wstep, wind)
% this function computing the 12 first coeficients 
    
%% real cepstrum   
    Cr=vrceps(record,channels,nb_coef,wlen,wstep,wind); % cumpute the 12 coeficients for all frames


%% LPC cepstrum
    AR_order=16;        % order of the ar model
    lpc=vaceps(record,channels,AR_order,nb_coef,wlen,wstep,wind); % cumpute the 12 coeficients for all frames

%% MfCC cepstrum
    M=30;       % number of band of filter bank  
    fmin=0;     % minimal frequency of filter-bank 
    fmax=8000; % maximal frequency of filter-bank   usual speech band
    mfcc=vmfcc(record,channels,nb_coef,M,wlen,fs,fmin,fmax,wstep,wind);
    
%%
%plp = vmplp(record,channels,nb_coef,M,wlen,fs,fmin,fmax,wstep,wind);