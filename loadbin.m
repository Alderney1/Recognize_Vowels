function y=loadbin(filename,channels,len);

% Function LOADBIN: Loading of binary INTEGER data file to vector.
%                   Data are normalized - <-1,1> range.
%
% Usage: y=loadbin(filename[,channels,len]);
%   filename   - name of binary data file 
%
% Optional parameters:                                             <Defualt values>
%   channels   - number of channels of signal                                   <1>
%   len  - desired length of ALL data     <integer - according length of data file>
%
% Output:
%   y      - output signal vector/matrix (format as follows)
%             s1(1),   s2(1),  ...,  sn(1),
%             s1(2),   s2(2),  ...,  sn(2),
%             s1(3),   s2(3),  ...,  sn(3),
%               :        :      :      : 
%             1-st.,   2-nd.,   :    n-th channel
 

%                              Made by PP
%                            28 March 1995
%                           CTU FEL,  Prague

if nargin==1,
  channels=1;
  len=inf;
elseif nargin==2,
  len=inf;
elseif nargin>3,
  disp('ERROR: Too many parameters of loadbin !');
  return;
end;

MAXINT=32768 ;


F=fopen(filename,'rb');
if F==-1,
  disp('Error: Enable to open signal !');
  return;
end;

[y,count]=fread(F,len,'short');

fclose(F);

disp(sprintf('%.0f samples were read!',count));

y=y(:)./MAXINT;
yy=reshape(y,channels,length(y)/channels);
y=yy';
