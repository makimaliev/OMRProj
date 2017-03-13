function[out] = createLetterObjects()
letters = linspace('A', 'Z', 26);
letters(17) = [];
letters(22) = [];
letters(22) = [];

startPointY = 110;

for i = 1:23
    letterObjs(i) = LetterClass;
    letterObjs(i).letter = char(letters(i));
    letterObjs(i).startPointY = startPointY;
    startPointY = startPointY+40;
    letterObjs(i).endPointY = startPointY;
    startPointY = startPointY+10;
end

out = letterObjs;