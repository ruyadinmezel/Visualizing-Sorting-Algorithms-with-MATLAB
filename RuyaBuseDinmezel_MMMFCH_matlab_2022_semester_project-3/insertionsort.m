%insertionsort
%The array is virtually split into a sorted and an unsorted part.Initially the first element is counted as sorted part.
% Values from the unsorted part are picked and placed at the correct position in the sorted part.

%insertion sort algorithm iterates through the randomly created array i=2
%to i=n
%iterate through the array starting from the second element 
%assign i th element value to variable x
%assign k=i-1 
%if k th elements value is bigger then x and k is bigger or equal to 1
%we assign k th elements value to k+1 th elements value
%and decrease k value with k-1


%creates a random integer array

array= randi([1,100],1,20)


%visualizes insertion  sort algorithm with bar chart
index=1:size(array,2);
figure(1)
cla
hold on
bars = bar(index,array,'FaceColor','b');
axis off
y=max(array);
ylim([0,y]);

insertionsorted_array=InsertionSort(array,bars)

%function for insertion sort
function array = InsertionSort(array,bars)
n=size(array,2);

for i= 2:n
    x=array(i);
    k=i-1;

    while k>= 1 && x< array(k)
        %unsorted value is placed on the right position
        array(k+1)=array(k);
        k= k-1;
    end

    array(k+1)= x;
  %update bar chart, waits for 0.2 seconds to help see how the algorithm
  %works
    bars.YData= array;
    pause(0.2)
    drawnow()

end
%bar charts turns to green when the algortihm is completed
bars.FaceColor='g';
end