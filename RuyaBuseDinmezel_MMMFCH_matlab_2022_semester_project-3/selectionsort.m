%selectionsort
%selection sort algorithm sorts an array by continuesly finding the minimum
% element from unsorted part and placing it to begining
%iterates through i= 1 to n
%min is first assumen to be the first element
%after comparing with the rest of the array
%if there is a smaller element than current min 
%min is updated and the element is placed to its according place


%creates a random integer array
array= randi([1,100],1,20)


%visualizes selection sort sort algorithm with bar chart
index=1:size(array,2);
figure(1)
cla
hold on
bars = bar(index,array,'FaceColor','b');
axis off
y=max(array);
ylim([0,y]);

%function for selection sort
selectionsorted_array=SelectionSort(array,bars)


function array = SelectionSort(array,bars)
n=size(array,2);

for i= 1:n
    min=i;
    for k=i+1:n
        if array(min)> array(k)
            min=k;       
        end
    end

    temp=array(i);
    array(i)= array(min);
    array(min)=temp;
    %update bar chart, waits for 0.2 seconds to help see how the algorithm
    %works
  
    bars.YData= array;
    pause(0.5)
    drawnow()
end
%bar charts turns to green when the algortihm is completed
bars.FaceColor='g';
end