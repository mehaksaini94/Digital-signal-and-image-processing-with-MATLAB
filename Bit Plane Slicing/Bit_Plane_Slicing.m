% Task3 - Data Hiding Method using Bit Plane Slicing Technique
% Name: SHIKHAR CHANDRA Reg.No:18BEC0146 Ph:9971099569 Slot:L3+L4
% Date: 01/03/21

close all;
clear all;
a= imread('lena.bmp'); % Reading original source image 
figure(1);
imshow(a);
title('ORIGINAL IMAGE');

[m n o] = size(a); %m=512,n=512,o=3
figure(2);imshow(a(:,:,1));title('RED PLANE');
figure(3);imshow(a(:,:,2));title('GREEN PLANE');
figure(4);imshow(a(:,:,3));title('BLUE PLANE');
R(:,:)=a(:,:,1); %Creating variable for Red Plane Image
G(:,:)=a(:,:,2); %Creating variable for Green Plane Image
B(:,:)=a(:,:,3); %Creating variable for Blue Plane Image

for i=1:m
    for j=1:n
        for k=1:8
            bitplanesR(i,j,k)=bitget(a(i,j,1),k); %Binary pixel values of Red Plane image
        end
    end
end

for i=1:8 % Loop for slicing the Red plane into 8 different bit planes
    figure(5);
    subplot(2,4,i);
    titleString= 'bit planes(RED PLANE)';
    imagesc(uint8(bitplanesR(:,:,i)));
    axis equal;
    colormap(gray);
    title([titleString int2str(i-1)]);
end
bitplanesR(:,:,1)=0; %Masking the first bit plane
bitplanesR(:,:,2)=0; %Masking the second bit plane
for i=1:8
    figure(6);
    subplot(2,4,i);
    titleString= 'bit planes(RED PLANE)';
    imagesc(uint8(bitplanesR(:,:,i)));
    axis equal;
    colormap(gray);
    title([titleString int2str(i-1)]);
end
b1=zeros(m,n);
b1(:,:)=0;
for i=1:m % Loop for reconstructing the Red plane 
    for j=1:n
        for k=1:8
            b1(i,j)=b1(i,j)+bitplanesR(i,j,k)*(2^(k-1));
        end
    end
end
figure(8)
imshow(uint8(b1));
title('Recovered Red Plane');
b1=uint8(b1);

% Result and Analysis:
% S= ssim(b1,R), P= psnr(b1,R)
% for bit(1,2): SSIM=0.9915, PSNR=42.6990
% for bit(3,4): SSIM=0.8956, PSNR=30.7207
% for bit(5,6): SSIM=0.5520, PSNR=17.9181

% Conclusion:
% SSIM(structural similarity index measure) is used for measuring the quality by capturing the similarity of
% images based on three comparisons-luminance, contrast and structure which
% are selected for measure of imperceptibility.
% PSNR(Peak Signal to Noise Ratio) is the square of ratio of maximum pixel
% value,i.e, 255 to the MSE(Mean Squared Error) value. Images having high
% PSNR value are preferrable. Also an image having less MSE value is more preferrable for transfer of the secret text.
 
