function running()
% 目的: 加強run_gary.jpg圖片的亮度

f = imread('run_gray.jpg');
s = size(f);
f2 = f; f3 = f; f4 = f; f5 = f;

% 用power law方法加強亮度
for i=1:s(1)
    for j=1:s(2)
        f2(i,j) = power_law_trans(f(i, j), 0.8);
        f3(i,j) = power_law_trans(f(i, j), 1.2);
        f4(i,j) = power_law_trans(f(i, j), 1.5);
        f5(i,j) = power_law_trans(f(i, j), 2);
    end
end

imwrite(f2, 'run_adjust0.8.jpg');
imwrite(f3, 'run_adjust1.2.jpg');
imwrite(f4, 'run_adjust1.5.jpg');
imwrite(f5, 'run_adjust2.0.jpg');

% 用histogran equalization加強亮度
f = hist_equa(f);
imwrite(f, 'run_histEqua.jpg');

end