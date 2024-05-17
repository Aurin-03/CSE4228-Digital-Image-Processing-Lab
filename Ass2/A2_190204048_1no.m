I = imread('cameraman.png');

[row , col] = size(I);
X = zeros(1,256);

for i=1:row
    for j=1:col
        temp = I(i,j);
        X(temp+1) = X(temp+1)+1;
    end
end

num_pixels = row * col;
PDF = X ./ num_pixels;

%  CDF 
CDF = zeros(1, 256);
cumulative_sum = 0;

for i = 1:256
    cumulative_sum = cumulative_sum + PDF(i); 
    CDF(i) = cumulative_sum; 
end
CDF_equalized = CDF * 255;

I_equalized = zeros(row, col);
for i = 1:row
    for j = 1:col
        I_equalized(i, j) = round(CDF_equalized(I(i, j) + 1));
    end
end

% Display original image
figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');

% Display equalized image
subplot(2, 2, 2);
imshow(uint8(I_equalized));
title('Equalized Image');

% equalized er histogram
equalized_X = zeros(1, 256);
for i = 1:row
    for j = 1:col
        temp = I_equalized(i, j);
        equalized_X(temp + 1) = equalized_X(temp + 1) + 1;
    end
end
% Step h
subplot(2, 2, 3);
bar(X);
title('Original Histogram');

subplot(2, 2, 4);
bar(equalized_X);
title('Equalized Histogram');









