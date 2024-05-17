A = imread('redBack.jpg');
B= imread('Victim.png');
figure;
imshow(A);
imtool(B);
B= cat(3,B,B,B);
[row,col,ch]= size(B);
for i = 1:row
    for j = 1: col
        r=B(i,j,1);
        g=B(i,j,2);
        b=B(i,j,3);
        if r ==146 || g==146 || b==146
            B(i,j,1)=A(i,j,1);
            B(i,j,2)=A(i,j,2);
            B(i,j,3)=A(i,j,3);
        end
        
    end
end

figure;
imshow(B);
