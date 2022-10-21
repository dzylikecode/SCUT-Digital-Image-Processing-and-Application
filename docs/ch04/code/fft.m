I = imread('d:\dip\ex4_1.jpg');
subplot(1, 2, 1), imshow(I)
I1 = rgb2gray(I);
J = fft2(I1);
F = abs(J);
J1 = fftshift(F);
subplot(1, 2, 2), imshow(J1, [100 250])
% 读入原始图象
I = imread('i_peppers_gray.bmp');
imshow(I)
%求离散傅立叶频谱
J = fftshift(fft2(I));
% 对原始图象进行二维傅立叶变换,并将其坐标原
点移到频谱图中央位置
figure(2);
imshow(log(abs(J)), [8, 10])
