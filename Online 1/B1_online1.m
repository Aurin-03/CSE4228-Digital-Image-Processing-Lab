A = imread('turkey.jpg'); % Replace 'turkey_flag.jpg' with the path to your image
C = A;
[row, col, ch] = size(A);
imtool(A);
for i = 1:row
    for j = 1:col
        r=A(i,j,1);
        g=A(i,j,2);
        b=A(i,j,3);
        
        % Check if the pixel falls within the red range
        if (r == 226 && g==10 && b==23) || (r == 229 && g==9 && b==21)
            C(i, j, :) = 0; % Set the pixel to black (0,0,0)
        end
        
        if r == 255 && g == 255 && b == 255
            % Set red pixels to black
            C(i, j, :) = [255, 255, 0]; % Set the pixel to black (0,0,0)
        end
    end
end
% Display the modified image
figure;
imshow(uint8(C)); % Convert back to uint8 for display
