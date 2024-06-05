%This function places the border, snake and apple on the gameBoard matrix, representing them with -1, 1 and 2 respectively
function[gameBoard] = updateGameBoard(gameBoard, gameBoardTrueLength, snake, apple, obstacle) 
    %For loop that changes the value in the gameBoard matrix to -1 if it is a border
    %Loops through every row and column
    for borderRowPosition = [1:gameBoardTrueLength]
        for borderColumnPosition = [1:gameBoardTrueLength]
            %If the cell is on the border (index 1 or max in roq or column)
            if borderRowPosition == 1|| borderRowPosition == gameBoardTrueLength ||borderColumnPosition == 1||borderColumnPosition == gameBoardTrueLength
                gameBoard(borderRowPosition, borderColumnPosition) = -1;
            end
        end
    end
    
    %For loop that changes the value in the gameBoard matrix to 1 if the snake is occupying that position
    %Gets the amount of rows of the snake matrix
    snakeLength = size(snake,1);
    %For every row in the snake matrix
    for snakeElement = [1:snakeLength]
        %Takes the x and y coordinates for all elements in the snake matrix
        %Changes the values on the gameBoard to 1 to differentiate them from the rest of the values
        gameBoard(snake(snakeElement,1), snake(snakeElement,2)) = 1;
    end
        
    %For loop that changes the value in the gameBoard matrix to 2 if the apple is occupying that position
    %Gets the amount of rows of the apple matrix
    appleLength = size(apple,1);
    %For every row in the apple matrix
    for appleElement = [1:appleLength]
        %Takes the x and y coordinates for all elements in the apple matrix
        %Changes the values on the gameBoard to 2 to differentiate them from the rest of the values
        gameBoard(apple(appleElement,1), apple(appleElement,2)) = 2;
    end
    
    %For loop that changes the value in the gameBoard matrix to -1 if the obstacle is occupying that position
    %Gets the amount of rows of the obstacle matrix
    obstacleLength = size(obstacle,1);
    for obstacleElement = [1:obstacleLength]
        %Takes the x and y coordinates for all elements in the obstacle matrix and
        %changes the values on the gameBoard to -1 to differentiate them from
        %the rest of the values and have the same properties as the border
        gameBoard(obstacle(obstacleElement,1), obstacle(obstacleElement,2)) = -1;
    end
end