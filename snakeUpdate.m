%This function updates the matrix snake, by changing its position or making it grow
function[snake] = snakeUpdate(snake, snakeDirection, appleCollision)
    %The new head position is concated to the top of the matrix snake, by adding the direction to the current position
    snake = [snake(1,1) + snakeDirection(1), snake(1,2) + snakeDirection(2); snake];
    %Removing the last row from the matrix snake as the snake is no longer occupying that position and has moved
    %The last row is only emptied if an apple has not been eaten, this is because the old tail can become the new tail when snakeLength is increased by 1
    if appleCollision == false
        %Last row deleted by selecting all the columns in the last row and emptying the,
        snake(end,:) = [];
    end
end