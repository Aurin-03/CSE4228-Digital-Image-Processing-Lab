I = imread('cameraman.png');
figure;
imshow(I);

c = 5;
I = im2double(I);
[row, col] = size(I);
X = zeros(row, col);
Y = zeros(row, col);
for i = 1:row
    for j = 1:col
        temp = I(i, j);
        X(i, j) = exp(I(i, j) - 1)/c ; % Inverse log transformation
        Y(i, j) = exp(I(i, j) / c) - 1; % Inverse log transformation
    end
end
figure;
imshow(X);
figure;
imshow(Y);


