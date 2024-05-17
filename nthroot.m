I = imread('cameraman.png'); 
c = 1;
n=2;
O=  c * double(I).^(1/n);
% Rescale the transformed image to the range [0, 255]
O= uint8((255 / max(O(:))) * O);

% Display the original and transformed images
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
title('Transformed Image');

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



