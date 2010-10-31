% Copyright 2010 Martin Thompson (martin@parallelpoints.com). All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without modification, are
% permitted provided that the following conditions are met:
% 
%    1. Redistributions of source code must retain the above copyright notice, this list of
%       conditions and the following disclaimer.
% 
%    2. Redistributions in binary form must reproduce the above copyright notice, this list
%       of conditions and the following disclaimer in the documentation and/or other materials
%       provided with the distribution.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
% BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
% CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

filename='testkb';
img=imread(sprintf('../%s.pgm', filename));
img=double(img); % convert to double so we can do non-integer maths
sobelx=[1 2 1; 0 0 0; -1 -2 -1];
ix=filter2(sobelx ,img);
iy=filter2(sobelx',img);
ix2=ix.*ix;
ixy=ix.*iy;
iy2=iy.*iy;
c1=(ix2+iy2);
c2=(4*ixy.*ixy + ((ix2-iy2).^2)).^0.5;
c=c1-c2;
peaks=zeros(size(c));
      