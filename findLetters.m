function[] = findLetters(centroids)
letterObjs = createLetterObjects();
[r c] = size(centroids);
text = '';
for i=1:r
    pointY = centroids(i).Centroid(2);
    pointX = centroids(i).Centroid(1);
    for j=1:23
        if(pointY >= (letterObjs(j).startPointY - 2)) && (pointY <= (letterObjs(j).endPointY + 2))
            text = strcat(text, letterObjs(j).letter);
            break;
        end
    end
end

disp(text);