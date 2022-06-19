m = rgb2gray(imread('C:\Users\Marjan\Documents\MATLAB\AIR.jpg'));
% figure
% imhist(m);
G = fspecial('gaussian',[10 10],1);
Ig = imfilter(m,G,'same');
figure,imshow(Ig);title('with gaussian');
[row,col]=size(Ig);
for y=2:col-6
    for x=2:row-6
        difference_of_intensity = abs(Ig(x,y) - Ig(x+1, y))+abs(Ig(x,y) - Ig(x+2, y))+abs(Ig(x,y) - Ig(x+3, y))+abs(Ig(x,y) - Ig(x+4, y))+abs(Ig(x,y) - Ig(x+5, y));
        if difference_of_intensity < 120
            Ig(x,y) = 0;
        else
            Ig(x,y) = 255;
        end    
    end    
end
figure,imshow(Ig);title('methode1');