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
        if i == 1
            blankimg(i:row_height, :, :) = i1(i:row_height, :, :);
        elseif i == 3
            blankimg(2*row_height:3*row_height, :, :) = i1(2*row_height:3*row_height, :, :);
        else 
            blankimg(4*row_height+1:5*row_height, :, :) = i1(4*row_height+1:5*row_height, :, :);
        end
    else 
        if i == 2
            blankimg(row_height+1:2*row_height, :, :) = i2(row_height+1:2*row_height, :, :);
        elseif i == 4
            blankimg(3*row_height+1:4*row_height, :, :) = i2(3*row_height+1:4*row_height, :, :);
        else 
            blankimg(5*row_height+1:6*row_height, :, :) = i2(5*row_height+1:6*row_height, :, :);
        end
    end
end
figure;
imshow(blankimg);

