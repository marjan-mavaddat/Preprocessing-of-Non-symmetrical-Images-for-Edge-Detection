m = imread('C:\Users\Marjan\Documents\MATLAB\AIR.jpg');
G = fspecial('gaussian',[10 10],1);
Ig = imfilter(m,G,'same');
figure,imshow(Ig);title('with gaussian');
g1=rgb2gray(Ig);
[row,col]=size(g1);
for y=2:col-6
    for x=2:row-6
        difference_of_intensity = abs(g1(x,y) - g1(x+1, y))+abs(g1(x,y) - g1(x+2, y))+abs(g1(x,y) - g1(x+3, y))+abs(g1(x,y) - g1(x+4, y))+abs(g1(x,y) - g1(x+5, y));
        if difference_of_intensity < 120
            g1(x,y) = 0;
        else
            g1(x,y) = 255;
        end    
    end    
end
figure,imshow(g1);title('methode2');