function[] = findTestMarked2(centroids)

choices(1:105) = {''};
choiceObjs = createChoiceObjects();

[r c] = size(centroids);

for i=1:r
    pointX = centroids(i).Centroid(1);
    pointY = centroids(i).Centroid(2);
    for j=1:105
        if(pointY >= (choiceObjs(j).startPointY - 2)) && (pointY <= (choiceObjs(j).endPointY + 2)) && (pointX >= (choiceObjs(j).startPointX - 2)) && (pointX <= (choiceObjs(j).endPointX + 2))
            choices(j) = strcat(choices(j), getChoice(pointX)); 
            break;
        end
    end
end

choices = choices';

fileID = fopen('answers2.txt','w');
formatSpec = '%d: %s\n';
[nrows,ncols] = size(choices);

for row = 1:nrows
    fprintf(fileID,formatSpec, row, choices{row,:});
end

fclose(fileID);

%celldisp(choices);