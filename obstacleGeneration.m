%This function generates a new obstacle if an apple has been eaten
function[obstacle] = obstacleGeneration(snake, apple, obstacle, gameBoardLength)
    %Generates a new randomly positioned obstacle while checking that it is not generated in the same cell as anything else
    generatedObstaclePass = false;
    %If the obstacle passes the checks the loop will break, otherwise a new obstacle will be generated
    while generatedObstaclePass == false
        %If the obstacle passes the checks the loop will break, otherwise a new obstacle will be generated
        generatedObstaclePass = true;
        %Generates random positions for new obstacle that are not on the border
        obstacleXPosition = 1 + randi(gameBoardLength);
        obstacleYPosition = 1 + randi(gameBoardLength);
        %Concatenes new aobstacle posiiton onto matrix containg all apple positions
        obstacle = [obstacle; obstacleYPosition obstacleXPosition];
        
        %Nested loop to see if snake collides with an obstacle
        %For the amount of elements/rows in snake and obstacle
        for snakeRow = 1:size(snake, 1)
            for obstacleRow = 1:size(obstacle, 1)
                %Compares every row in both matrices
                %If two of the rows are the same, the obstacle does not pass the checks and will end up generating a new obstacle
                if isequal(snake(snakeRow, :), obstacle(obstacleRow, :))
                    generatedObstaclePass = false;
                    break
                end
            end
        end
        %Nested loop to see if an obstacle collides with an apple, as having them on the same sqaure will break functionality of the code
        %For the amount of elements/rows in apple and obstacle
        for obstacleRow = 1:size(obstacle, 1)
            for appleRow = 1:size(apple, 1)
                %Compares every row in both matrices
                %If two of the rows are the same, the obstacle does not pass the checks and will end up generating a new obstacle
                if isequal(obstacle(obstacleRow, :), apple(appleRow, :))
                    generatedObstaclePass = false;
                    break
                end
            end
        end
        %Nested loop to see if an obstacle collides with another obstacle, as having two obstacle in the same cell will result in there being one less total obstacle
        %For the amount of elements/rows in apple and obstacle
        for obstacleRow = 1:size(obstacle, 1)
            for obstacleRow2 = 1:size(obstacle, 1)
                %Compares every row in both matrices
                %Checks if row is equal to another but not same row
                %If two of the rows are the same, the obstacle does not pass the checks and will end up generating a new obstacle
                if isequal(obstacle(obstacleRow, :), obstacle(obstacleRow2, :)) && obstacleRow ~= obstacleRow2
                    generatedObstaclePass = false;
                    break
                end
            end
        end
    end
end