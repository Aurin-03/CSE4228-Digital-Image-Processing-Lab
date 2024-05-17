originalImage = imread('flower.png');
originalImage = rgb2gray(originalImage);

imtool(originalImage);
[height, width] = size(originalImage);

outputImage = originalImage;

for i = 1:height
    for j = 1:width  % Fixed loop condition
        if (i > (height * 1/4) && i < (height * 3/4) && j < (width * 3/4))
            if originalImage(i, j) >= 70
                %outputImage(i, j) = min(255, originalImage(i, j) + originalImage(i, j) * 0.6);
                outputImage(i, j) = originalImage(i, j) + originalImage(i, j) * 0.6;% Increase brightness by 60%
            else
                %outputImage(i, j) = max(0, originalImage(i, j) - originalImage(i, j) * 0.7);% Decrease brightness by 70%
                outputImage(i, j) = originalImage(i, j) - originalImage(i, j) * 0.7;
            end
        end        
    end
end

figure;
imtool(outputImage);

X = zeros(1, 256);

% Calculate histogram of the output image
for i = 1:height
    for j = 1:width
        temp = outputImage(i, j);
        X(temp + 1) = X(temp + 1) + 1;
    end
end

% Display the output image
figure;
subplot(1, 2, 1);
imshow(outputImage);
title('Output Image');

% Display the histogram of the output image
subplot(1, 2, 2);
bar(X);
title('Histogram of Output Image');
xlabel('Pixel Value');
ylabel('Frequency');
