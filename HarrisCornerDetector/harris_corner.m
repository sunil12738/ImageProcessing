
I=(imread('chess.png'));
if(size(I, 3)==1);
else I=rgb2gray(I);
end
%I=rgb2gray(S);
I2=im2double(I);
prewitt_x = [-1 0 1 ; -1 0 1; -1 0 1];
prewitt_y = [1 1 1 ; 0 0 0; -1 -1 -1];
Ix=conv2(I2,prewitt_x,'same');
Iy=conv2(I2,prewitt_y,'same');
%calculation related to matrix M
%determinant of matrix M
k=input('Enter k: between 0.04 and 0.15: ');%b/w 0.04-0.15
det=(Ix.^2).*(Iy.^2)-(Ix.*Iy);
trace=(Ix.^2)+(Iy.^2);
Mc=det-(trace.^2)*k;
inter1=size(I,1);
level = graythresh(Mc);
Mc = im2bw(Mc,level);
for i=1:inter1
    for j=1:inter1
        if (i==1) || (j==1) || (i==inter1) || (j==inter1)
            arr(i,j)=Mc(i,j);
        else
            a=[Mc(i,j+1),Mc(i,j-1),Mc(i+1,j),Mc(i-1,j),Mc(i+1,j+1),Mc(i-1,j-1),Mc(i-1,j+1),Mc(i+1,j-1)];
            m=max(a);
            arr(i,j)=m;
        end
    end
end

thresh=level/2;
cimmx = (arr==Mc) & (arr>thresh);
for i=1:inter1
    for j=1:inter1
        if(cimmx(i,j)==true) arr1(i,j)=0;
        else arr1(i,j)=1;
        end
    end
end
imshow(arr1);