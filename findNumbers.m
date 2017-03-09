clear;clc;
%Read input image and the template
I = rgb2gray(imread('answers.jpg'));
temp = rgb2gray(imread('marked2.jpg'));

imshow(I, [])
hold on

%Read 15 numbers
for i = 1:105
    eval(['number', int2str(i), '= rgb2gray(imread(''Numbers/',int2str(i) ,'.jpg''))']);
    temp = eval(['number', int2str(i)]);
    
    %Find height and length of template
    [n, m] = size(temp);

    %Find all marked points
    [markedPoints] = findtemplate(I, temp, 0.9);
    rectangle('position', [markedPoints(1).Centroid(1), markedPoints(1).Centroid(2), m, n], 'EdgeColor','r','LineWidth',2);
end
% 
% for i=1:r
%     rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), n, m], 'EdgeColor','r','LineWidth',2);
% end



