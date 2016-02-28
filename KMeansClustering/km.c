#include<stdio.h>
#include<math.h>
int main(){
	int no_cls,tot_point,i,j;
	scanf("%d %d",&no_cls,&tot_point);
	int tot_pt[tot_point];//total number of points
	for (i = 0; i < tot_point; ++i)
	{
		scanf("%d",&tot_pt[i]);
		/* code */
	}

	int array[no_cls][1000];
	int centroid[no_cls];
	int prev_centroid[no_cls];
	int diff[no_cls];
	int count_in_each[no_cls];//count of each cluster
	//assign first n points as cluster
	for (i = 0; i < no_cls; ++i)
	{
		centroid[i]=tot_pt[i];
		count_in_each[i]=0;
		prev_centroid[i]=-999;
		/* code */
	} 

	int min=999999;
	int pointer=-1;//for storing which is minimum
	//run iteration for each point
	int k;
	for(k=0;k<999999;++k)	
	{
		for (i = 0; i < tot_point; ++i)
		{
			//printf("%d\n",i );
			for (j= 0; j < no_cls; ++j)
			{	
				if(centroid[j]>tot_pt[i])
					diff[j]=centroid[j]-tot_pt[i];
				else 
					diff[j]=tot_pt[i]-centroid[j];
				//printf("%d ",diff[j] );
			}
			//find the min of them
			for (j = 0; j < no_cls; ++j)
			{
				if(diff[j]<min) 
				{
				min=diff[j];
				pointer=j;
				}
				else ;
				
			}
			//printf("\n%d %d\n",min,pointer );
			min=999999;
			array[pointer][count_in_each[pointer]]=tot_pt[i];
			++count_in_each[pointer];
		}

		/*for (i = 0; i < no_cls; ++i)
		{
			for (j = 0; j < tot_point; ++j)
			{
				//printf("%d ", array[i][j]);
				
			} printf("centroid[i]=%d\n",centroid[i]);
			
		}*/
		int sum=0,med_c=0;
		for (i = 0; i < no_cls; ++i)
		{
			for (j = 0; j < count_in_each[i]; ++j)
			{
				sum=sum+array[i][j];
			}
			prev_centroid[i]=centroid[i];
			//float f=sum/(float)count_in_each[i];
			centroid[i]=round((float)sum/(float)count_in_each[i]);
			//printf("new centroid %d\n",centroid[i]);
			sum=0;
			if (prev_centroid[i]==centroid[i])
			{
				++med_c;
				//printf("med_c %d\n",med_c);
			}
		}
		
		if (med_c==no_cls)
		{
			for (i = 0; i < no_cls; ++i)
			{
				for (j = 0; j < tot_point; ++j)
				{
					if(array[i][j]!=0) printf("%d ", array[i][j]);
				
				} printf("centroid[%d]=%d\n",i,centroid[i]);
				
			}
			return 0;
		}
		for (i = 0; i < no_cls; ++i)
		{
			for (j = 0; j < 20; ++j)
			{
				array[i][j]=0;
				
			} 
			count_in_each[i]=0;
			
		}
	}
	
	return 0;
}