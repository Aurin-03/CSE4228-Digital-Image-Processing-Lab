I = imread('flower.png');

% Convert to grayscale if it's an RGB image
I = rgb2gray(I);

% Convert to uint8 (optional step)
I = im2double(I);

% Display original image
figure;
imshow(I);
title('Original Image');

% Get image size
[row, col] = size(I);

% Define transformation parameters
C = 0.3;

% Initialize a new matrix for the transformed image
I_transformed = zeros(row, col);  % Using 'double' to allow for floating-point calculations

rRow1 = row * (3 / 4) ;
cCol1 = (col/2);
C1=2;
gamma = 0.9 ; 

% Apply logarithmic transformation
for i = 1:row
    for j = 1:col
        if( i < rRow1 && j < cCol1)
            I_transformed(i, j) = C * log((I(i, j)) + 1);
        elseif (  i > (row*(1/4)) && j >= (cCol1+1))
            I_transformed(i, j) = C1 * ( I(i , j) .^ gamma );
        else 
            I_transformed(i, j) = I(i , j);
        end
        
    end
end

% Display transformed image
figure;
imshow((I_transformed));
title('Transformed Image');
