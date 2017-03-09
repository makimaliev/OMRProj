%%
close all;
clear
clc
%img = imread('testMarked.jpg');
img = imread('testMarked.jpg');
imgOrg = img;
img = rgb2gray(img);
%title('Original Image');
%imshow(img);
img = medfilt2(img, [5 5]);
BW2 = edge(img,'canny');
%title('Applied Canny');
%figure, imshow(BW2)
%%
%level = graythresh(img);
%BW2 = im2bw(img,level);
%BW2 = ~BW2;
%figure, imshow(BW2)
%%
se = strel('disk',10);
imgE = imclose(BW2, se);
%title('Applied imclose');
%figure, imshow(imgE);
filled = imfill(imgE, 'holes'); %fill holes
%title('Applied imfill');
%figure, imshow(filled);
filled = bwareaopen(filled, 20000); %remove objecst smaller than 20000 pixels
%title('Applied bwareaopen');
%figure, imshow(filled);

%% label each connected component
[L num] = bwlabel(filled);
boundaries = bwboundaries(filled);

%% finds orientation and rotates if image is rotated
% blobMeasurements = regionprops(L, 'Orientation');   
% allOrientations = [blobMeasurements.Orientation];
% angleToRotate = -allOrientations(1);
% rotatedImage = imrotate(imgOrg, angleToRotate);
% figure, imshow(rotatedImage);

%%
figure, imshow(imgOrg);
hold on;

for k=1:num
   b = boundaries{k};
   plot(b(:,2),b(:,1),'g','LineWidth',3);
end