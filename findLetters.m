clf
%Read input image and the template
I = rgb2gray(imread('testName.jpg'));
temp = rgb2gray(imread('marked.jpg'));

%Read 23 letters, no 'Q, W, X'
letterA1 = rgb2gray(imread('Letters/A_1.jpg'));
letterA2 = rgb2gray(imread('Letters/A_2.jpg'));
letterB1 = rgb2gray(imread('Letters/B_1.jpg'));
letterB2 = rgb2gray(imread('Letters/B_2.jpg'));
letterC1 = rgb2gray(imread('Letters/C_1.jpg'));
letterC2 = rgb2gray(imread('Letters/C_2.jpg'));
letterD1 = rgb2gray(imread('Letters/D_1.jpg'));
letterD2 = rgb2gray(imread('Letters/D_2.jpg'));
letterE1 = rgb2gray(imread('Letters/E_1.jpg'));
letterE2 = rgb2gray(imread('Letters/E_2.jpg'));
letterF1 = rgb2gray(imread('Letters/F_1.jpg'));
letterF2 = rgb2gray(imread('Letters/F_2.jpg'));
letterG1 = rgb2gray(imread('Letters/G_1.jpg'));
letterG2 = rgb2gray(imread('Letters/G_2.jpg'));
letterH1 = rgb2gray(imread('Letters/H_1.jpg'));
letterH2 = rgb2gray(imread('Letters/H_2.jpg'));
letterI1 = rgb2gray(imread('Letters/I_1.jpg'));
letterI2 = rgb2gray(imread('Letters/I_2.jpg'));
letterJ1 = rgb2gray(imread('Letters/J_1.jpg'));
letterJ2 = rgb2gray(imread('Letters/J_2.jpg'));
letterK1 = rgb2gray(imread('Letters/K_1.jpg'));
letterK2 = rgb2gray(imread('Letters/K_2.jpg'));
letterL1 = rgb2gray(imread('Letters/L_1.jpg'));
letterL2 = rgb2gray(imread('Letters/L_2.jpg'));
letterM1 = rgb2gray(imread('Letters/M_1.jpg'));
letterM2 = rgb2gray(imread('Letters/M_2.jpg'));
letterN1 = rgb2gray(imread('Letters/N_1.jpg'));
letterN2 = rgb2gray(imread('Letters/N_2.jpg'));
letterO1 = rgb2gray(imread('Letters/O_1.jpg'));
letterO2 = rgb2gray(imread('Letters/O_2.jpg'));
letterP1 = rgb2gray(imread('Letters/P_1.jpg'));
letterP2 = rgb2gray(imread('Letters/P_2.jpg'));
letterR1 = rgb2gray(imread('Letters/R_1.jpg'));
letterR2 = rgb2gray(imread('Letters/R_2.jpg'));
letterS1 = rgb2gray(imread('Letters/S_1.jpg'));
letterS2 = rgb2gray(imread('Letters/S_2.jpg'));
letterT1 = rgb2gray(imread('Letters/T_1.jpg'));
letterT2 = rgb2gray(imread('Letters/T_2.jpg'));
letterU1 = rgb2gray(imread('Letters/U_1.jpg'));
letterU2 = rgb2gray(imread('Letters/U_2.jpg'));
letterV1 = rgb2gray(imread('Letters/V_1.jpg'));
letterV2 = rgb2gray(imread('Letters/V_2.jpg'));
letterY1 = rgb2gray(imread('Letters/Y_1.jpg'));
letterY2 = rgb2gray(imread('Letters/Y_2.jpg'));
letterZ1 = rgb2gray(imread('Letters/Z_1.jpg'));
letterZ2 = rgb2gray(imread('Letters/Z_2.jpg'));

%Find height and length of template
[n, m] = size(temp);

%Find all marked points
[markedPoints] = findtemplate(I, temp, 0.6);

[r, c] = size(markedPoints);
imshow(I, [])
hold on
for i=1:r
    rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','r','LineWidth',2);
end
isFound = 0;

hold on
for i = 1:r
    rect = [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m*2 + 2, n + 2];
    cropped = imcrop(I, rect);
    %detect 'A'
    isFound = 0;
    found1 = findtemplate(cropped, letterA1, 0.85);
    if(size(found1) > 0)
        isFound = 1;
        disp('A');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterA2, 0.84);
    if(size(found2) > 0) & (isFound == 0)
        disp('A');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'B'
    isFound = 0;
    found1 = findtemplate(cropped, letterB1, 0.85);
    if(size(found1) > 0)
        isFound = 1;
        disp('B');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterB2, 0.85);
    if(size(found2) > 0) & (isFound == 0)
        disp('B');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'C'
    isFound = 0;
    found1 = findtemplate(cropped, letterC1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('C');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterC2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('C');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'D'
    isFound = 0;
    found1 = findtemplate(cropped, letterD1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('D');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterD2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('D');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'E'
    isFound = 0;
    found1 = findtemplate(cropped, letterE1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('E');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterE2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('E');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'F'
    isFound = 0;
    found1 = findtemplate(cropped, letterF1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('F');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterF2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('F');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'G'
    isFound = 0;
    found1 = findtemplate(cropped, letterG1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('G');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterG2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('G');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'H'
    isFound = 0;
    found1 = findtemplate(cropped, letterH1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('H');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterH2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('H');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'I'
    isFound = 0;
    found1 = findtemplate(cropped, letterI1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('I');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterI2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('I');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'J'
    isFound = 0;
    found1 = findtemplate(cropped, letterJ1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('J');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterJ2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('J');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'K'
    isFound = 0;
    found1 = findtemplate(cropped, letterK1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('K');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterK2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('K');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'L'
    isFound = 0;
    found1 = findtemplate(cropped, letterL1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('L');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterL2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('L');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'M'
    isFound = 0;
    found1 = findtemplate(cropped, letterM1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('M');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterM2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('M');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'N'
    isFound = 0;
    found1 = findtemplate(cropped, letterN1, 0.85);
    if(size(found1) > 0)
        isFound = 1;
        disp('N');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterN2, 0.85);
    if(size(found2) > 0) & (isFound == 0)
        disp('N');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'O'
    isFound = 0;
    found1 = findtemplate(cropped, letterO1, 0.88);
    if(size(found1) > 0)
        isFound = 1;
        disp('O');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterO2, 0.88);
    if(size(found2) > 0) & (isFound == 0)
        disp('O');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'P'
    isFound = 0;
    found1 = findtemplate(cropped, letterP1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('P');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterP2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('P');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'R'
    isFound = 0;
    found1 = findtemplate(cropped, letterR1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('R');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterR2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('R');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'S'
    isFound = 0;
    found1 = findtemplate(cropped, letterS1, 0.86);
    if(size(found1) > 0)
        isFound = 1;
        disp('S');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterS2, 0.86);
    if(size(found2) > 0) & (isFound == 0)
        disp('S');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'T'
    isFound = 0;
    found1 = findtemplate(cropped, letterT1, 0.86);
    if(size(found1) > 0)
        isFound = 1;
        disp('T');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterT2, 0.86);
    if(size(found2) > 0) & (isFound == 0)
        disp('T');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
       
    %detect 'U'
    isFound = 0;
    found1 = findtemplate(cropped, letterU1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('U');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterU2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('U');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'V'
    isFound = 0;
    found1 = findtemplate(cropped, letterV1, 0.8);
    if(size(found1) > 0)
        isFound = 1;
        disp('V');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterV2, 0.8);
    if(size(found2) > 0) & (isFound == 0)
        disp('V');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'Y'
    isFound = 0;
    found1 = findtemplate(cropped, letterY1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('Y');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterY2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('Y');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
    %detect 'Z'
    isFound = 0;
    found1 = findtemplate(cropped, letterZ1, 0.9);
    if(size(found1) > 0)
        isFound = 1;
        disp('Z');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    found2 = findtemplate(cropped, letterZ2, 0.9);
    if(size(found2) > 0) & (isFound == 0)
        disp('Z');
        rectangle('position', [markedPoints(i).Centroid(1), markedPoints(i).Centroid(2), m, n], 'EdgeColor','g','LineWidth',2);
    end
    
end

