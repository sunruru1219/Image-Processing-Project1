function dog()
% 目的: 降低dog_gary.jpg圖片的亮度
f = imread('dog_gray.jpg');
s = size(f);
f2 = f; f3 = f; f4 = f; f5 = f;

% 用power law方法加強亮度
for i=1:s(1)
    for j=1:s(2)
        f2(i,j) = power_law_trans(f(i, j), 0.70);
        f3(i,j) = power_law_trans(f(i, j), 0.75);
        f4(i,j) = power_law_trans(f(i, j), 0.80);
        f5(i,j) = power_law_trans(f(i, j), 0.85);
    end
end

imwrite(f2, 'dog_adjust0.70.jpg');
imwrite(f3, 'dog_adjust0.75.jpg');
imwrite(f4, 'dog_adjust0.80.jpg');
imwrite(f5, 'dog_adjust0.85.jpg');

% 用histogran equalization調整亮度
f = hist_equa(f);
imwrite(f, 'dog_histEqua.jpg');

end