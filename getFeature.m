function [ features ] = getFeature( rgbim )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 %color feature
 fet1=color_luv(rgbim);
 %edge feature
 fet2=edgehist(rgbim);
 %texture feature
 %glcm-gray level co occurrence matrix
 glcm=graycomatrix(rgb2gray(rgbim));
 fet3=glcm(:);
 features=[fet1;fet2;fet3];

end

