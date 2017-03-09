function[out] = createChoiceObjects()
numbers = 1:105;

startX = 56;
startY = 59;

currentX = startX;
currentY = startY;

count = 0;

for i = 1:105
    choiceObjs(i) = ChoiceClass;
    choiceObjs(i).number = numbers(i);
    choiceObjs(i).startPointX = currentX;
    choiceObjs(i).startPointY = currentY;
    currentY = currentY+40;
    choiceObjs(i).endPointX = currentX + 240;
    choiceObjs(i).endPointY = currentY;
    currentY = currentY+9.85;
    count = count + 1;
    if(count == 15)
        currentY = startY;
        currentX = currentX + 300;
        count = 0;
    end
end

out = choiceObjs;