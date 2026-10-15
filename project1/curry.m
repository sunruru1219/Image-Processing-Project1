function curry()
% 目的: 使用average filter&median filter來處理salt and pepper noise
f = imread('curry_gray.jpg');
s = size(f);

% step0: add salt&pepper noise to image
f0 = f;
noise_percent = 10;
for i = 1:s(1)
    for j=1:s(2)
        noise_check = randi(noise_percent);
        if (noise_check == noise_percent)
            f0(i, j) = randi(256);
        end
    end
end
imwrite(f0, 'curry_salt10.jpg');

% step1: denoise with average filter
blur_3 = ones(3, 3)/9;
blur_5 = ones(5, 5)/25;
blur_7 = ones(7, 7)/49;

f1 = f0; f2 = f0; f3 = f0;

for i = 1:s(1)
    for j=1:s(2)
        f1(i,j) = my_spatial_filter(f0, i, j, blur_3, 3);
        f2(i,j) = my_spatial_filter(f0, i, j, blur_5, 5);
        f3(i,j) = my_spatial_filter(f0, i, j, blur_7, 7);
    end
end

% step2: output
imwrite(f1, 'curry_blur3.jpg');
imwrite(f2, 'curry_blur5.jpg');
imwrite(f3, 'curry_blur7.jpg');

% step3: denoise with msdian filter
f4 = f0; f5 = f0; f6 = f0;
for i = 1:s(1)
    for j=1:s(2)
        f4(i,j) = my_median_filter(f0, i, j, 3);
        f5(i,j) = my_median_filter(f0, i, j, 5);
        f6(i,j) = my_median_filter(f0, i, j, 7);
    end
end

end