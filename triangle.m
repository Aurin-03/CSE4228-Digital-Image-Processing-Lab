i1 = imread('cameraman.png');


imshow(i1);



[row, col] = size(i1);


col_height = col/2;

for i = 1:(row/2)
    for j = 1:col_height
        i1(i,j) = 0;
    end
    col_height = col_height - 1;
end

figure;
imshow(i1);
