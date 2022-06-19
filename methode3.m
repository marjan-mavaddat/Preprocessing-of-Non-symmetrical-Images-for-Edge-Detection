m = rgb2gray(imread('C:\Users\Marjan\Documents\MATLAB\AIR.jpg'));
[row,col]=size(m);
for y=2:col-6
    for x=2:row-6
        difference_of_intensity = abs(m(x,y) - m(x+1, y))+abs(m(x,y) - m(x+2, y))+abs(m(x,y) - m(x+3, y))+abs(m(x,y) - m(x+4, y))+abs(m(x,y) - m(x+5, y));
        if difference_of_intensity > 120
            m(x,y) = 0;
        else
            m(x,y) = 255;
        end    
    end    
end
figure,imshow(m);title('method 3-without gaussian');
G = fspecial('gaussian',[10 10],1);
Ig = imfilter(m,G,'same');
figure,imshow(Ig);title('method 3-with gaussian');
J = imclearborder(Ig);
figure,imshow(J);title('with clear border image');
se=strel('disk',4);
img1 = imopen(J,se);
img2 = imerode(img1,se);
img3 = imclose(img2,se);
bw_image=im2bw(img3,0.1);
figure,imshow(bw_image);title('with erode');
y = edge(img3,'canny');
figure,imshow(y);title('Canny Filter');