w=imread('C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg')
subplot(2,2,1)
imshow(w), title('original image')
y=rgb2gray(w)
subplot(2,2,2)
imshow(y), title('gray image')
z=imcomplement(y)
subplot(2,2,3)
imshow(z), title('complement image')
c=size(w);
for i=1:c(1)
    for j=1:c(2)
        for k=1:c(3)
            w(i,j,k)=255-w(i,j,k);
        end
    end
end
subplot(2,2,4)
imshow(w), title('negative image')
