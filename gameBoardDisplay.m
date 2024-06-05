%This function displays the gameBoard using Matlab's image related functions and colourcoding each object of the program
function gameBoardDisplay(gameBoard, gameBoardTrueLength)
    %Making an empty array to store the data of the displayed image
    gameDisplay = [];
    %Each cell of the gameBoard will be displayed using a set of 20h x 20 'pixels'
    imSize = gameBoardTrueLength*20;
    %Defining the length and width of the gameBoardDisplay
    numRows = imSize;
    numCols = imSize;
    %Populating the image using a nested loop
    %Loops through every row by going through every column of every row
    for row=[1:numRows]
        for col = [1:numCols]
            %ceil(row/20) results in all numbers from 1-20 accessing cell with index 1, 21-40 index 2, etc
            %This results in the sets of 20 'pixels' all representing the same cell

            %0 in cell of array means nothing important, represented with white
            if gameBoard(ceil(row/20), ceil(col/20)) == 0
                %Hexadecimal colour codes (rgb) used to represent colour
                pixelVal = uint8([255, 255, 255]);
            %1 in cell of array means snake, represeted with green as intuitive
            elseif gameBoard(ceil(row/20), ceil(col/20)) == 1
                pixelVal = uint8([0, 255, 0]);
            %2 in cell of array means apple, represeted with red as intuitive    
            elseif gameBoard(ceil(row/20), ceil(col/20)) == 2
                pixelVal = uint8([255, 0, 0]);
            %-1 in cell of array means border, represeted with black to communicate hard border   
            elseif gameBoard(ceil(row/20), ceil(col/20)) == -1
                pixelVal = uint8([0, 0, 0]);
            end
            % Assign pixel value to gameDisplay
            gameDisplay(row, col, :) = pixelVal;
        end
    end

    %Displays the game board as an image
    imshow(gameDisplay);
end