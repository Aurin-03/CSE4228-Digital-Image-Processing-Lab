I1 = imread('Image1.jpg');
%I1 = rgb2gray('Image1.jpg');
%imtool(I1);
subplot(2,4,1);
imshow(I1);
title('Figure (a)');
%%%%
I = im2double(I1);
[row, col] = size(I);

lap_filter = [ 0 1  0;
               1 -4 1;
               0 1  0 ] ;
          
          
new_img = zeros(row + 2, col + 2);
new_img(2:row + 1, 2:col + 1) = I(1:row, 1:col);

[new_img_row, new_img_col] = size(new_img);
lapI = zeros(row + 2, col + 2);

for i = 2:new_img_row - 1
    for j = 2:new_img_col - 1
        data = new_img(i - 1 : i + 1, j - 1 : j + 1) .* lap_filter;
        data_sum = 0;
        for p = 1:3
            for q = 1:3
                data_sum = data_sum + data(p, q);
            end
        end
        
        lapI(i, j) = data_sum;
    end
end

subplot(2, 4, 2);
imshow(lapI, []);  
imwrite(lapI, 'Image2.jpg');
title('Figure (b)');
%%%%%
%lap = zeros(row, col);
lap = lapI(2:row+1 , 2:col+1);
enhanceI = I - lap;

subplot(2, 4, 3);
imshow(enhanceI); 
imwrite(enhanceI, 'Image3.jpg');
title('Figure (c)');
%%%%%       
hx = [-1 0 1;
      -2 0 2;
      -1 0 1];
 
hy = [  -1    -2   -1;
         0     0    0;
         1     2    1];
t = 0.1;
new_img1 = zeros(row + 2, col + 2);
new_img1(2:row + 1, 2:col + 1) = I(1:row, 1:col);
[new_img_row1, new_img_col1] = size(new_img1);
Rx = zeros(row + 2, col + 2);
Ry = zeros(row + 2, col + 2);

for i = 2:new_img_row1 - 1
    for j = 2:new_img_col1 - 1
        data1 = new_img1(i - 1: i + 1, j - 1: j + 1) .* hx;
        data_sum1 = 0;
        data2 = new_img1(i - 1: i + 1, j - 1: j + 1) .* hy;
        data_sum2 = 0;
        for p = 1:3
            for q = 1:3
                data_sum1 = data_sum1 + data1(p, q);
                data_sum2 = data_sum2 + data2(p, q);
            end
        end
        
        Rx(i, j) = data_sum1;
        Ry(i, j) = data_sum2;
    end
end

R = (Rx.^2 + Ry.^2).^0.5;

for i = 1:row + 2
    for j =1:col + 2
        if(R(i,j)<t)
          R(i,j)=0;
        end
    end
end

Rs = R(2:row+1 , 2:col+1);
subplot(2, 4, 4);
imshow(Rs); 
imwrite(Rs, 'Image4.jpg');
title('Figure (d)');
%%%%%
avg = ones(5,5) / 25;
[Rrow, Rcol] = size(Rs);

new_img2 = zeros(Rrow + 4, Rcol + 4);
new_img2(3:Rrow + 2, 3:Rcol + 2) = Rs(1:Rrow, 1:Rcol);

[new_img_row2, new_img_col2] = size(new_img2);
A = zeros(row, col);

for i = 3:new_img_row2 - 2
    for j = 3:new_img_col2 - 2
        data3 = new_img2(i - 2: i + 2, j - 2: j + 2) .* avg;
        data_sum3 = 0;
        for p = 1:5
            for q = 1:5
                data_sum3 = data_sum3 + data3(p, q);
            end
        end
        
        A(i, j) = data_sum3;
    end
end
Av = A(3:new_img_row2 - 2, 3:new_img_col2 - 2);
subplot(2, 4, 5);
imshow(Av);  
imwrite(Av, 'Image5.jpg');
title('Figure (e)');
%%%%
figf = enhanceI.*Av;
subplot(2, 4, 6);
imshow(figf);  
imwrite(figf, 'Image6.jpg');
title('Figure (f)');
%%%%
figg = I+figf;
subplot(2,4,7);
imshow(figg);
imwrite(figg, 'Image7.jpg');
title('Figure (g)');
%%%%%
co = 1;
gamma = 0.5;

[r,c] = size(figg);
h = zeros(size(figg));
for i = 1:r
    for j =1:c
        h(i,j) = co.*(figg(i,j).^gamma);
    end
end

subplot(2,4,8);
imshow(h);
imwrite(h, 'Image8.jpg');
title('Figure (h)');
