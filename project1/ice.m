function ice()
% 目的: 銳化ice_gray.jpg的邊緣

f = imread('ice_gray.jpg');
fb = imread('ice_gray_b.jpg');
s = size(f);

f1 = f; f2 = f; f3 = f;
f1b = f; f2b = f; f3b = f;
% step1: calculate blur matrix
blur_3 = ones(3, 3)/9;
blur_5 = ones(5, 5)/25;
blur_7 = ones(7, 7)/49;

% step2: calculate blurred image
for i=1:s(1)
    for j=1:s(2)
        f1(i,j) = my_spatial_filter(f, i, j, blur_3, 3);
        f2(i,j) = my_spatial_filter(f, i, j, blur_5, 5);
        f3(i,j) = my_spatial_filter(f, i, j, blur_7, 7);
        f1b(i,j) = my_spatial_filter(fb, i, j, blur_3, 3);
        f2b(i,j) = my_spatial_filter(fb, i, j, blur_5, 5);
        f3b(i,j) = my_spatial_filter(fb, i, j, blur_7, 7);
    end
end

% step3-1: output blurred image
%imwrite(f1, 'ice_blur3.jpg');
%imwrite(f2, 'ice_blur5.jpg');
%imwrite(f3, 'ice_blur7.jpg');

% step3-2: output detail image (original - blurred)
imwrite(f-f1, 'ice_detail3.jpg');
imwrite(f-f2, 'ice_detail5.jpg');
imwrite(f-f3, 'ice_detail7.jpg');
imwrite(fb-f1b, 'ice_detail3b.jpg');
imwrite(fb-f2b, 'ice_detail5b.jpg');
imwrite(fb-f3b, 'ice_detail7b.jpg');

% step3-3: output sharpened image (original + detail)
imwrite(2*f-f1, 'ice_sharp3.jpg');
imwrite(2*f-f2, 'ice_sharp5.jpg');
imwrite(2*f-f3, 'ice_sharp7.jpg');
imwrite(2*fb-f1b, 'ice_sharp3b.jpg');
imwrite(2*fb-f2b, 'ice_sharp5b.jpg');
imwrite(2*fb-f3b, 'ice_sharp7b.jpg');
imwrite(f+fb-f1b, 'ice_sharp3mix.jpg');
imwrite(f+fb-f2b, 'ice_sharp5mix.jpg');
imwrite(f+fb-f3b, 'ice_sharp7mix.jpg');
end