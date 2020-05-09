function category = classifypoints(file, points)
%Reads parameters from file and classifies points into two 
%categories, A or B. This file is created by netbp2.m.
%points is a matrix with two rows, where points(:,i) contains the 
%(x,y) coordinates of point i.
%Returns vector category, where category(i) is 1 if
%points(1,i) >= points(2,i) and 0 otherwise.
    
    fullMatFileName = fullfile(pwd,  file);
    if ~exist(fullMatFileName, 'file')
        message = sprintf('%s does not exist', fullMatFileName);
        uiwait(warndlg(message));
    else
        s = load(fullMatFileName);
        W2 = s.W2;
        W3 = s.W3;
        W4 = s.W4;
        b2 = s.b2;
        b3 = s.b3;
        b4 = s.b4;
        category = zeros(1, length(points(1,:)));
      
        for i = 1:length(points(1,:))
            a2 = activate(points(:,i),W2,b2);
            a3 = activate(a2,W3,b3);
            a4 = activate(a3,W4,b4); 
            if(a4(1,1) >= a4(2,1))
                category(i) = 1;
            else
                category(i) = 0;
            end
        end    
    end
end