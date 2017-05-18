clear all; close all; clc;

rbImage = im2double(imread('icon_back.png'));
[h, w, ~] = size(rbImage);
imshow(rbImage);
rbImage_4 = NN(rbImage );
%imshow(rbImage_4 );

%% Mouse input
xlabel ('Select at most 100 points along the outline', 'FontName', '?L?n??????', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(99);
ctrlPointList = [ctrlPointX ctrlPointY];
ctrlPointList_4 = [ctrlPointX*4 ctrlPointY*4];
clickedN = size(ctrlPointList,1);

%disp(ctrlPointList );
%disp(ctrlPointList_4);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '?L?n??????', 'FontSize', 14);

%% Calculate Bazier Curve (Your efforts here)
High = 1 ;
Low = 0 ;
outlineVertexList = Bezier(ctrlPointList,High);  %Enrich outlineVertexList
outlineVertexList_4 = Bezier(ctrlPointList_4,High);  



%% Draw and fill the polygon  Last 3 input arguments: (ctrlPointScattered, polygonPlotted, filled)

 result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
 output2 = drawAndFillPolygon( rbImage_4, ctrlPointList_4, outlineVertexList_4, true, true, true );
 output1 = NN(result);

imwrite(output1, 'output1.png');
imwrite(output2, 'output2.png');
