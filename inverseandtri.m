i = imread('flower.png');
i1 = rgb2gray(i);
i1 = im2double(i1);
imshow(i1);

X = i1;

[row, col] = size(i1);

c = 0.9;
c1=3;
gam = 0.7;

col_height = col/2;

for i = 1:(row/2)
    for j = 1:col_height
        X(i, j) = exp(i1(i, j) - 1)/c ;
    end
    col_height = col_height - 1;
end

col_height = col / 2;
co = col/2;
% Apply nth root transformation to the right below part diagonally
for i = 1:(row / 2)
    for j = col_height:-1:co
        X(i, j) = c1 * (i1(i, j) .^ (1 / gam));
    end
    co = co-1;
end

c11 = col;
for i = (row / 2): row
    for j = col_height:c11
         X(i, j) = exp(i1(i, j) - 1)/c ;
    end
    c11 = c11-1;
end

c11 = col;
c2 = col;
for i = (row / 2): row
    for j = c11:-1:c2
         X(i, j) = c1 * (i1(i, j) .^ (1 / gam));
    end
    c2 = c2-1;
end
figure;
imshow(X);
