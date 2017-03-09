function[out] = getChoice(x)
startX = 56;
endX = startX + 40;
for i = 1:7
    if(x >= startX - 2) && (x <= endX + 2)
        out = 'A';
        break;
    end
    startX = endX + 10;
    endX = startX + 40;
    if(x >= startX - 2) && (x <= endX + 2)
        out = 'B';
        break;
    end
    startX = endX + 10;
    endX = startX + 40;
    if(x >= startX - 2) && (x <= endX + 2)
        out = 'C';
        break;
    end
    startX = endX + 10;
    endX = startX + 40;
    if(x >= startX - 2) && (x <= endX + 2)
        out = 'D';
        break;
    end
    startX = endX + 10;
    endX = startX + 40;
    if(x >= startX - 2) && (x <= endX + 2)
        out = 'E';
        break;
    end
    startX = endX + 60;
    endX = startX + 40;
end

