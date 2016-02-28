
sigma = input('Enter the value of sigma: ');
y = input('Enter the value of y for (2y+1)*(2y+1) filter: ');
k = 2*y+1;
%gaussian filter
g_f = 1/(2*pi*sigma*sigma);
fprintf('%d\n',g_f);
%formula = ;
for i = 1:k
    for j = 1:k
        i1=i;
        j1=j;
        if(i1>y+1) 
            i1=k-i1+1;
        end
        if(j1>y+1)
            j1=k-j1+1;
        end
        t1=(i1-y-1)*(i1-y-1);
        t2=(j1-y-1)*(j1-y-1);
        B(i,j) = g_f * exp(-(t1+t2)/(2*sigma*sigma));
    end
end
%{
for i=1:y+1
    for j=y+2:k
        B(i,j)=B(i,k-j+1);
        fprintf('%d %d = %d \n',i,j,B(i,j));
    end
end

for j=1:k
    for i=y+2:k
        %fprintf('%d %d = %d ',i,j,B(i,j));
        B(j,i)=B(k-j+1,i);
    end
end
%}
for i = 1:k
    for j = 1:k
        fprintf('%d ',B(i,j));
    end
    fprintf('\n');
end 





%function after appyling blurring
I=(imread('cube.png'));
if(size(I, 3)==1);
else I=rgb2gray(I);
end
I2=im2double(I);
C=conv2(I2,B,'same');
%gradient operator
robert_cross_operator_x = [0 1; -1 0]
robert_cross_operator_y = [1 0; 0 -1]
prewitt_x = [-1 0 1 ; -1 0 1; -1 0 1]
prewitt_y = [1 1 1 ; 0 0 0; -1 -1 -1]
sobel_x = [-1 0 1 ;-2 0 2; -1 0 1]
sobel_y = [1 2 1; 0 0 0; -1 -2 -1]
prewitt_4x = [ -3 -1 1 3; -3 -1 1 3; -3 -1 1 3; -3 -1 1 3]
prewitt_4y = [3 3 3 3; 1 1 1 1; -1 -1 -1 -1; -3 -3 -3 -3]
%calculate magnitude of grad
Ix=conv2(I2,robert_cross_operator_x,'same');
Iy=conv2(I2,robert_cross_operator_y,'same');
mag=sqrt(Ix.*Ix+Iy.*Iy);
theta=atand(Iy/Ix);
%image thresholding
level = graythresh(mag);
thres_img = im2bw(mag,level);
%imshow(thres_img);
interm1=size(Ix,1);
%map to 0-180
for i=1:interm1
    for j=1:interm1
        if(theta(i,j)<0)
            theta(i,j)=theta(i,j)+180;
        end
    end
end
%round to nearest value
for i=1:interm1
    for j=1:interm1
        if(theta(i,j)>=0) && (theta(i,j)<22.5)
            theta(i,j)=0;
        elseif (theta(i,j)>=22.5) && (theta(i,j)<67.5)
            theta(i,j)=45;
        elseif (theta(i,j)>=67.5) && (theta(i,j)<102.5)
            theta(i,j)=90;
        elseif (theta(i,j)>=102.5) && (theta(i,j)<157.5)
            theta(i,j)=135;
        elseif (theta(i,j)>=157.5) && (theta(i,j)<180)
            theta(i,j)=0;
        end
    end
end

for i=1:interm1
    for j=1:interm1
        after_non_s(i,j)=-1;
    end
end
%non maximum supression
for i=1:interm1
    for j=1:interm1
        if (i==1)||(j==1)||(i==interm1)||(j==interm1)
            after_non_s(i,j)=mag(i,j);
        elseif theta(i,j)==0
            if (mag(i,j-1)<mag(i,j)) && (mag(i,j+1)<mag(i,j))
                after_non_s(i,j)=mag(i,j);
            else
                after_non_s(i,j)=0;
            end
        elseif theta(i,j)==45
            if (mag(i+1,j-1)<mag(i,j)) && (mag(i-1,j+1)<mag(i,j))
                after_non_s(i,j)=mag(i,j);
            else
                after_non_s(i,j)=0;
            end
        elseif theta(i,j)==90
            if (mag(i-1,j)<mag(i,j)) && (mag(i+1,j)<mag(i,j))
                after_non_s(i,j)=mag(i,j);
            else
                after_non_s(i,j)=0;
            end
        elseif theta(i,j)==135
            if (mag(i-1,j+1)<mag(i,j)) && (mag(i+1,j-1)<mag(i,j))
                after_non_s(i,j)=mag(i,j);
            else
                after_non_s(i,j)=0;
            end
        end
    end
end
fprintf('Level is: %f\n',level);
thres_min=input('input minimum threshold: ');
thres_max=input('input maximum threshold: ');
for i = 3:interm1-2
    for j = 3:interm1-2
        if(mag(i,j)>thres_min)
            if (mag(i+1,j)>=thres_max) 
                after_non_s(i,j)=mag(i+1,j);
            elseif (mag(i,j-1)>=thres_max)
                after_non_s(i,j)=mag(i,j-1);
            elseif (mag(i-1,j)>=thres_max)
                after_non_s(i,j)=mag(i-1,j);
            elseif (mag(i,j+1)>=thres_max)
                after_non_s(i,j)=mag(i,j+1);
            elseif (mag(i-1,j+1)>=thres_max) 
                after_non_s(i,j)=mag(i+1,j);
            elseif (mag(i-1,j-1)>=thres_max)
                after_non_s(i,j)=mag(i,j-1);
            elseif (mag(i+1,j-1)>=thres_max)
                after_non_s(i,j)=mag(i-1,j);
            elseif (mag(i+1,j+1)>=thres_max)
                after_non_s(i,j)=mag(i,j+1);
            end
        end
    end
end
%imshow(after_non_s);
thresh=level/2; 
cimmx = (after_non_s>thresh);
for i=1:interm1
    for j=1:interm1
        if(cimmx(i,j)==true) arr1(i,j)=1;
        else arr1(i,j)=0;
        end
    end
end
imshow(arr1);