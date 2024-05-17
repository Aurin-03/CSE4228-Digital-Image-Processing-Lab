I1 = imread('cameraman.png');
I = im2double(I1);

A = min(I(:));
B = max(I(:));

D = B - A;
%M = double(intmax(class(I)));
M = 255;
R = I-A;
R = R./D;
R = R.*M;
R = R + A;

R = uint8(R);

[row, col] = size(I1);
[r , c] = size(R);

X = zeros(1,256);
XR = zeros(1,256);

% I er histogram
for i=1:row
    for j=1:col
        temp = I1(i,j);
        X(temp+1) = X(temp+1)+1;
    end
end

% R er histogram
for i=1:r
    for j=1:c
        temp = R(i,j);
        XR(temp+1) = XR(temp+1)+1;
    end
end
%
%plotting
figure;

subplot(2, 2, 1);
imshow(I);
title('Input Image');

subplot(2, 2, 2);
imshow(R);
title('Contrast Image');

subplot(2, 2, 3);
bar(X);
title('Input image Histogram');

subplot(2, 2, 4);
bar(XR);
title('Contrast image Histogram');