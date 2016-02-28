------------------------------------------------------------------------------------------------------------
Markov Chain Analysis of Snake and Ladder game.
----------------------------------------------
The game of snake and ladder obeys the markov(memorylessness) property. At any point on the game, the probability of moving from one block number to another in the game is independent of the previous moves. The experiment was done on two different sets of game with one million iterations of game played on each. The graph of the number of moves in which the game ended vs total number of such game has been plotted.

The input would consist of:
1. The first and second number(n,m) are the number of ladder and snake in the game.
2. The next n set of two numbers are the starting and ending position of the ladder.
3. The next m set of two number are the starting and ending position of the ladder.

To get the result directly run the command 'bash mca.sh' on the terminal. This will generate the output file output1.m containing the values in x(number of times the game in a move was finished) vs the y(the number of moves). The graph is plotted and saved as result1.jpg

To do manually, uncomment the lines 14, 16, 25, 30, 32 and comment the lines 78 to 86 and then perform operations. The number of game are specified at line 36

Given are two input files, corresponding outputs and the resultant graphs in the submission. Result are for 1 million games. 
Output2 maximum game finishes at 19 moves. 
Output1 maximum game finishes at 23 moves.

-------------------------------------------------------------------------------------------------------------
Canny's edge detector.
---------------------
Used for detecting the edges in the image.
canny_edge.m is the file. It need to be run on matlab. The image which is input is to be specified at line 51 in the file. Now run the file and specify the value of sigma, value of the k(for (2k+1)X(2k+1) gaussian matrix), the two threshold(for double thresholding). I have taken the minimum threshold to be 10% of the value of level(it is displayed) and maximum threshold to be 50% of the value of level which is displayed for effective edge detection.

Several input images along with their corresponding images have also been attached.

-------------------------------------------------------------------------------------------------------------
Harris Corner Detector.
----------------------
Used for detecting corner in the images.
harris_corner.m is the file. It need to be run on matlab. The image file needs to be specified at 2nd line. Run the file and specify the value of k. After this output of the images comes.

Several input images along with their corresponding images have also been attached.

-------------------------------------------------------------------------------------------------------------

K-means clustering.
-------------------
Used to cluster datasets.
km.c is the file. It is a c file. The number of cluster and total number of points are need to be input. Then input the numbers. It will generate the cluster with their centroid.

example: It was ran on 100 numbers to form 6 cluster. The result are
 
41 40 38 40 42 40 centroid[0]=40

25 18 21 19 20 16 23 25 21 22 23 16 23 27 17 25 23 18 27 25 32 31 23 18 27 25 centroid[1]=22

9 2 1 15 1 6 10 12 11 12 10 12 6 8 15 1 11 11 1 12 3 4 11 12 2 12 8 3 9 14 12 14 13 15 3 8 3 8 centroid[2]=9

43 46 44 46 44 45 43 43 centroid[3]=44

29 32 32 35 33 36 31 34 34 33 36 36 32 34 30 32 31 36 centroid[4]=33

47 48 47 49 47 49 48 49 48 48 50 50 centroid[5]=48

-------------------------------------------------------------------------------------------------------------
