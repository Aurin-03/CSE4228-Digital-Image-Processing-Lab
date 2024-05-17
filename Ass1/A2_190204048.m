i1 = imread('aurin1.jpg');
i2 = imread('aurin2.JPG');

imshow(i1);
figure;
imshow(i2);

[row, col, ch] = size(i1);
blankimg = uint8(zeros(row, col, ch));

row_height = row / 6;

for i = 1:6
    if mod(i, 2) == 1
        blankimg((i-1)*row_height+1:i*row_height, :, :) = i1((i-1)*row_height+1:i*row_height, :, :);
    else
        blankimg((i-1)*row_height+1:i*row_height, :, :) = i2((i-1)*row_height+1:i*row_height, :, :);
    end
end

figure;
imshow(blankimg);
imwrite(blankimg,'output.jpg');