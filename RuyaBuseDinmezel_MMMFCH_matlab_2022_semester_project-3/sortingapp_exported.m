classdef sortingapp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        GridLayout           matlab.ui.container.GridLayout
        LeftPanel            matlab.ui.container.Panel
        SelectionSortButton  matlab.ui.control.Button
        InsertionSortButton  matlab.ui.control.Button
        BubbleSortButton     matlab.ui.control.Button
        RightPanel           matlab.ui.container.Panel
        UIAxes               matlab.ui.control.UIAxes
        ContextMenu          matlab.ui.container.ContextMenu
        Menu                 matlab.ui.container.Menu
        Menu2                matlab.ui.container.Menu
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: BubbleSortButton
        function BubbleSortButtonPushed(app, event)
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
axis off
hold on
points = bar(index,array,'FaceColor','b');
y=max(array);
ylim([0,y]);

bubblesorted_array=BubbleSort(array,points)

%function for bubble sort
function k = BubbleSort(array,points)

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
    points.YData= array;
    pause(0.3)
    drawnow()
end
%bar charts turns to green when the algortihm is completed
points.FaceColor='g';
end

        end

        % Button pushed function: InsertionSortButton
        function InsertionSortButtonPushed(app, event)
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

array= randi([1,100],1,40)


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
        end

        % Button pushed function: SelectionSortButton
        function SelectionSortButtonPushed(app, event)
%selectionsort
%selection sort algorithm sorts an array by continuesly finding the minimum
% element from unsorted part and placing it to begining
%iterates through i= 1 to n
%min is first assumen to be the first element
%after comparing with the rest of the array
%if there is a smaller element than current min 
%min is updated and the element is placed to its according place


%creates a random integer array
array= randi([1,100],1,40)


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
    pause(0.2)
    drawnow()
end
%bar charts turns to green when the algortihm is completed
bars.FaceColor='g';
end
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {373, 373};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {172, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 575 373];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {172, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create BubbleSortButton
            app.BubbleSortButton = uibutton(app.LeftPanel, 'push');
            app.BubbleSortButton.ButtonPushedFcn = createCallbackFcn(app, @BubbleSortButtonPushed, true);
            app.BubbleSortButton.Position = [39 275 100 22];
            app.BubbleSortButton.Text = 'Bubble Sort';

            % Create InsertionSortButton
            app.InsertionSortButton = uibutton(app.LeftPanel, 'push');
            app.InsertionSortButton.ButtonPushedFcn = createCallbackFcn(app, @InsertionSortButtonPushed, true);
            app.InsertionSortButton.Position = [40 175 100 22];
            app.InsertionSortButton.Text = 'Insertion Sort';

            % Create SelectionSortButton
            app.SelectionSortButton = uibutton(app.LeftPanel, 'push');
            app.SelectionSortButton.ButtonPushedFcn = createCallbackFcn(app, @SelectionSortButtonPushed, true);
            app.SelectionSortButton.Position = [40 69 100 22];
            app.SelectionSortButton.Text = 'Selection Sort';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create UIAxes
            app.UIAxes = uiaxes(app.RightPanel);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.FontSize = 1;
            app.UIAxes.Position = [13 34 349 306];

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UIFigure);

            % Create Menu
            app.Menu = uimenu(app.ContextMenu);
            app.Menu.Text = 'Menu';

            % Create Menu2
            app.Menu2 = uimenu(app.ContextMenu);
            app.Menu2.Text = 'Menu2';
            
            % Assign app.ContextMenu
            app.UIAxes.ContextMenu = app.ContextMenu;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = sortingapp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end