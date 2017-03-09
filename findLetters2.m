%Read input image and the template
I = rgb2gray(imread('testName.jpg'));
temp = rgb2gray(imread('marked.jpg'));

letterObjs = createLetterObjects();

%Find height and length of template
[n, m] = size(temp);

%Find all marked points
[markedPoints] = findtemplate(I, temp, 0.6);

r = size(markedPoints(:));
imshow(I, [])
hold on
for i=1:r
    rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','r','LineWidth',2);
end

text = '';
flag = 0;

for i=1:r
    pointY = markedPoints(i).Centroid(2);
    pointX = markedPoints(i).Centroid(1);
    if(pointX >= 330) && (flag == 0)
        text = strcat(text, {' '});
        flag = 1;
    end
    for j=1:23
        if(pointY >= (letterObjs(j).startPointY - 2)) && (pointY <= (letterObjs(j).endPointY + 2))
            text = strcat(text, letterObjs(j).letter);
            break;
        end
    end
end

disp(text);