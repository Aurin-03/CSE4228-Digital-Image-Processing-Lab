% Read a grayscale image
gray_image = imread('cameraman.png');

% Define a colormap (for example, 'parula')
cmap = parula(256); % You can choose any colormap available in MATLAB

% Normalize the grayscale image to [0, 1]
normalized_image = double(gray_image) / 255;

% Apply the colormap to the normalized grayscale image
rgb_image = ind2rgb(uint8(normalized_image * 255), cmap);

% Display the grayscale and RGB images
figure;
subplot(1, 2, 1);
imshow(gray_image);
title('Grayscale Image');

subplot(1, 2, 2);
imshow(rgb_image);
title('RGB Image from Grayscale');
