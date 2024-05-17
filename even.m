
% Shrinking the image to 1/2
I = imread('cameraman.png');
X = imread('som.jpg');

K = imfinfo('cameraman.png');
R = imfinfo('som.jpg');

if(K.BitDepth ==24)
  I=rgb2gray(I);
end
if(R.BitDepth ==24)
  X=rgb2gray(X);
end

[r,c] = size(I);
I2 = zeros(r,c);
I2(1:r/2, :) = I(1:r/2, :);

figure;
subplot(221),imshow(I);
subplot(222),imshow(X);
subplot(223),imshow(I2)