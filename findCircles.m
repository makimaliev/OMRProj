function[L, centroids] = findCircles(I)
im = I;
%read image
%im = rgb2gray(imread('answers.jpg'));
imOrg = im;
level = graythresh(im);
%bw = im < 200;
bw = im2bw(im,level);
bw = ~bw;
%imshow(bw);

%figure,
im2 = imopen(bw, strel('diamond',2));
%imshow(im2);

labeledImage = bwlabel(im2);
measurements = regionprops(labeledImage, 'Area');
allAreas = [measurements.Area];
blobsToKeep = find(allAreas > 700);
outputImage = ismember(labeledImage, blobsToKeep) > 0;

%figure,
%imshow(outputImage);

figure,
imshow(imOrg);

[L num] = bwlabel(outputImage);
boundaries = bwboundaries(L);
centroids = regionprops(L,'Centroid');
hold on;

for k=1:num
   b = boundaries{k};
   plot(b(:,2),b(:,1),'g','LineWidth',3);
end

% 
% [centers, radii, metric] = imfindcircles(im,[10 30]);
% 
% imshow(im);
% hold on
% 
% n = size(radii);
% 
% for i = 1:n
%     plot(centers(i,1), centers(i,2), '.r', 'MarkerSize', radii(i)*3);
% end
 
%  labeledImage = bwlabel(bw);
%  measurements = regionprops(labeledImage, 'Area');