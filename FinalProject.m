function FinalProject(begin)

if nargin<1, begin='start'; 
end

switch(begin)
    case 'start'    
        axis([0 1 0 1]);    % creates axis
        title('Click and Drag Mouse to Plot Points');
        set(gcf, 'WindowButtonDownFcn', 'Main down');
        h = uicontrol('position',[10,5,80,30]);
        set(h, 'String', 'Clear');
        set(h, 'Callback','Main erase');
 popup=uicontrol('style', 'popup', 'position', [100 5 80 30],'string', 'blue|yellow|magenta|cyan|red|green|black','tag', 'colorComboBox'); 
        
    case 'down'
        set(gcf, 'WindowButtonMotionFcn', 'Main move');
      
        set(gcf, 'WindowButtonUpFcn', 'Main up');
   
   case 'up'   
        set(gcf, 'WindowButtonMotionFcn', '');
       
        set(gcf, 'WindowButtonUpFcn', '');
     
    case 'move'
        currPoint = get(gca, 'CurrentPoint');
        xVal = currPoint(1,1);
        yVal = currPoint(1,2);
  
        
        popup = findobj(0, 'tag', 'colorComboBox');

%marks o's where clicked
        switch get(popup, 'value')
			case 1
                line(xVal, yVal, 'marker', 'o','color','b');
			case 2
                line(xVal, yVal, 'marker', 'o','color','y');
			case 3
                line(xVal, yVal, 'marker', 'o','color','m');
            case 4
                line(xVal, yVal, 'marker', 'o','color','c');
            case 5
                line(xVal, yVal, 'marker', 'o','color','r');
            case 6
                line(xVal, yVal, 'marker', 'o','color','g');
            case 7
                line(xVal, yVal, 'marker', 'o','color','k');
                %error message
			otherwise
				disp('Unknown option');
        end
        
      %erase everything button
    case 'Clear'
        h = findall(gca, 'type', 'line');
    
        delete(h);
  


end

end