function [  ] = saveDB( im, inputname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
clc;
im=imresize(im,[128 128]);
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=getFeature(rgbim);
a = struct('feature',fet,'name',inputname);
if exist ('im')
    if (exist('currency_db.mat')==2)
        load('currency_db.mat','-mat');
        qty=qty+1;
        currency{qty,1} = fet;
        currency{qty,2} = inputname;
        save('currency_db.mat','currency','qty','-append');
        msgbox('Database already exists: image succesfully added','Database result','help');
        clear('im');
    else
        qty=1;
        currency{qty,1} = fet;
        currency{qty,2} = inputname;
        dataset
        save('currency_db.mat','currency','qty');
        msgbox('Database was empty. Database has just been created. Image succesfully added','Database result','help');
        clear('im');
    end
end
end
