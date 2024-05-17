input_image = imread('cameraman.png'); % Replace 'your_image.png' with the path to your image
% Get the size of the image
[rows, cols] = size(input_image);
% Create an empty matrix for the mirror image
mirror_image = uint8(zeros(rows, cols));
% Create the mirror image manually by flipping horizontally
for i = 1:rows
    for j = 1:cols
        mirror_image(i, j) = input_image(i, cols - j + 1);
    end
end
% Display the original and mirrored image side by side
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');

subplot(1, 2, 2);
imshow(mirror_image);
title('Mirror Image');
