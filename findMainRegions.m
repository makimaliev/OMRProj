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

%%
% s  = regionprops(L, 'centroid');
% centroids = cat(1, s.Centroid);
% figure, imshow(filled)
% hold on
% plot(centroids(:,1), centroids(:,2), 'b*')
% hold off

%% Crop each connected component
Sdata=regionprops(L,'BoundingBox');
 
for i=1:num
    temp = imcrop(imgOrg,Sdata(i).BoundingBox);
    Name = strcat('Object Number:',num2str(i));
    figure,imshow(temp); title(Name);
    findCircles(temp);
end


%% find max region as test answers
measurements = regionprops(L, 'Area');
allAreas = [measurements.Area];
[maxRegion index] = max(allAreas);
imgMax = imcrop(imgOrg, Sdata(index).BoundingBox);
figure, imshow(imgMax);
[LL centroids] = findCircles(imgMax);
findTestMarked2(centroids);