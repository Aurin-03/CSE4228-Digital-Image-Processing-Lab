I = imread('cameraman.png');

threshold = 158;
O = I > threshold;

O = uint8(O) * 255;

subplot(2, 2, 1);
imshow(I);
title('Original Image');

[row,col]=size(I);

K=zeros(1,256);

for i=1:row
    for j=1:col
        temp=I(i,j)+1;
        K(temp)=K(temp)+1;
        
    end    
end

subplot(2,2,2);
bar(K);

subplot(2, 2, 3);
imshow(O);
title('Thresholded Image');

[row,col]=size(O);

K=zeros(1,256);

for i=1:row
    for j=1:col
        temp=O(i,j)+1;
        K(temp)=K(temp)+1;
        
    end    
end

subplot(2,2,4);
bar(K);

