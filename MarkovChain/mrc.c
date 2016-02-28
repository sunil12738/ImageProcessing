#include <stdio.h>
#define counts 1000
int main(){
	int n=101;//total block in snake ladders
	int block[n];
	int ladder[n],snake[n];
	int start=1;
	int counter=0;//for the number of times counter is increased
	int block_val;//current value of block
	int dice_val;//value of dice
	srand(time(NULL));
	int cnt[counts];
	int no_lad,no_snake,i,a,b;
	//printf("Number of ladder and snakes(two values): ");
	scanf("%d %d", &no_lad, &no_snake);
	//printf("Enter the starting and ending position of ladders\n");
	for(i=0;i<n;++i){
		ladder[i]=0;
		snake[i]=0;
	}
	for(i=0;i<counts;++i){
		cnt[i]=0;
	}
	for(i=0;i<no_lad;++i){
		//printf("Ladder %d: ",i+1);
		scanf("%d %d",&a,&b);
		ladder[a]=b;
	}

	//printf("Enter the starting and ending position of snakes\n");
	for(i=0;i<no_lad;++i){
		//printf("Snake %d: ",i+1);
		scanf("%d %d",&a,&b);
		snake[a]=b;
	}
	for(i=0;i<1000000;++i)
	{ 
	block_val=1;
	while(block_val!=100){
		
		dice_val = rand()%6+1;
		block_val=block_val+dice_val;
		if(block_val>100) 
			block_val=block_val-dice_val;
		if(ladder[block_val]!=0)
			block_val=ladder[block_val];
		if(snake[block_val]!=0)
			block_val=snake[block_val]; 
		//printf("%d %d\n",block_val,dice_val );
		++counter;
		if(counter>999) break;
	}
	//printf("%d,"counter);
	cnt[counter]++;
	counter=0;
	}

	//for the number of counter
	printf("x=[");

	for(i=0;i<counts;++i)
	{
		if(cnt[i]!=0) printf("%d ",cnt[i]);
		else ;
	}
	printf("]");

	printf("\n\n\n");

	printf("y=[");
	for(i=0;i<counts;++i)
	{
		if(cnt[i]!=0) printf("%d ",i);
		else ;
	}
	printf("]");

	printf("\n bar(y,x) \n");
	printf("xlabel \"Number of moves\" \n");
	printf("ylabel \"Number of games\" \n");
	printf("print -djpg result1_bar.jpg");

	printf("\n plot(y,x) \n");
	printf("xlabel \"Number of moves\" \n");
	printf("ylabel \"Number of games\" \n");
	printf("print -djpg result1_plot.jpg");

	return 0;
}