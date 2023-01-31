%Bubble Sort
%bubble sort algorithm works by iterating through adjacent elements
%first loop  itterates through elements i = 1 to i=n
%second loop iterates through elements k = 1 to k=n-1
%if  kth eleemnt is bigger than k+1 th element the elements swap values


%creates a random integer array
array= randi([1,100],1,40)

%visualizes bubble sort algorithm with bar chart
index=1:size(array,2);
figure(1)
cla
hold on
bars = bar(index,array,'FaceColor','b');
axis off
y=max(array);
ylim([0,y]);


bubblesorted_array=BubbleSort(array,bars)

%function for bubble sort
function k = BubbleSort(array,bars)

n=size(array,2);

for i= 1:n

    for k=1:n-1
        if array(k)> array(k+1)
            % swap k with k+1
            temp=array(k);
            array(k)= array(k+1);
            array(k+1)=temp;
        end

    end
  %update bar chart, waits for 0.3 seconds to help see how the algorithm
  %works
    bars.YData= array;
    pause(0.1)
    drawnow()
end
%bar charts turns to green when the algortihm is completed
bars.FaceColor='g';
end