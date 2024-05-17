I = imread('mrbean.PNG');
I = rgb2gray(I);
subplot(1, 3, 1), imshow(I), title('Input Image');

I = imnoise(I, 'Gaussian', 0.001);
old_img = I;
imwrite(old_img, 'noisy_image.jpg');
subplot(1, 3, 2), imshow(old_img), title('Gaussian Noise Image');

I = double(I);
[row, col] = size(I);
kernel_size = 3;

gaussian_X = [-1 0 1; -1 0 1; -1 0 1];
gaussian_Y = [-1 -1 -1; 0 0 0; 1 1 1];


prompt = 'Enter the sigma value = ';
sigma = input(prompt);

ker = -((gaussian_X .^ 2)+(gaussian_Y .^ 2))/(2*(sigma*sigma));
ker = exp(ker);
ker = (1.0/(2*pi*(sigma*sigma)))*ker;

new_img = zeros(row + 2, col + 2);
new_img(2:row + 1, 2:col + 1) = I(1:row, 1:col);
[new_img_row, new_img_col] = size(new_img);
outputImage = zeros(row, col);

for i = 1:new_img_row - 2
    for j = 1:new_img_col - 2
        data = new_img(i : i + 2, j : j + 2) .* ker;
        data_sum = 0;
        for p = 1:kernel_size
            for q = 1:kernel_size
                data_sum = data_sum + data(p, q);
            end
        end
        
        outputImage(i, j) = data_sum;
    end
end

outputImage = uint8(outputImage);


subplot(1, 3, 3), imshow(outputImage), title('Gaussian Filtered Image');
imwrite(outputImage, 'output.jpg');


