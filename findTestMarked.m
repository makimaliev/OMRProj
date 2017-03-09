clear;clc;
%Read input image and the template
I = rgb2gray(imread('answers.jpg'));
temp = rgb2gray(imread('marked2.jpg'));

choices(1:105) = {''};

choiceObjs = createChoiceObjects();

%Find height and length of template
[n, m] = size(temp);

%Find all marked points
[markedPoints] = findtemplate(I, temp, 0.56);

r = size(markedPoints(:));
imshow(I, [])
hold on
for i=1:r
    rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','r','LineWidth',2);
end

for i=1:r
    pointX = markedPoints(i).Centroid(1);
    pointY = markedPoints(i).Centroid(2);
    for j=1:105
        if(pointY >= (choiceObjs(j).startPointY - 2)) && (pointY <= (choiceObjs(j).endPointY + 2)) && (pointX >= (choiceObjs(j).startPointX - 2)) && (pointX <= (choiceObjs(j).endPointX + 2))
            choices(j) = strcat(choices(j), getChoice(pointX)); 
            break;
        end
    end
end

choices = choices';

fileID = fopen('answers.txt','w');
formatSpec = '%d: %s\n';
[nrows,ncols] = size(choices);

for row = 1:nrows
    fprintf(fileID,formatSpec, row, choices{row,:});
end

fclose(fileID);

%celldisp(choices);