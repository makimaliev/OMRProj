clc;    % Clear the command window.
clearvars;
close all;  % Close all figures (except those of imtool.)
baseFileName = 'test24.JPG';
% Get the full filename, with path prepended.
rgbImage = imread(baseFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(2, 2, 1);
imshow(rgbImage, []);
title('Original Color Image');
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Give a name to the title bar.
set(gcf,'name','Demo by ImageAnalyst','numbertitle','off') 

% Make sure it's 8 bit gray scale, not 24 bit true color.
grayImage = rgb2gray(rgbImage);

% Binarize the image by thresholding.
binaryImage = grayImage > 128;
% Fill in the black letters so we just have a white block.
binaryImage = imfill(binaryImage, 'holes');
subplot(2, 2, 2);
imshow(binaryImage, []);
title('Filled Image');

% Label each blob with 8-connectivity, so we can make measurements of it
[labeledImage numberOfBlobs] = bwlabel(binaryImage, 8);
% Get all the blob properties.
blobMeasurements = regionprops(labeledImage, 'Orientation');   
allOrientations = [blobMeasurements.Orientation]
% Extract just one orientation (there should only be one in this image).
angleToRotate = -allOrientations(1);
% Rotate the image.
rotatedImage = imrotate(grayImage, angleToRotate);
% Display the rotated image.
subplot(2, 2, 3);
imshow(rotatedImage, []);
title('Rotated Image');
