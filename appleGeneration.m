%This function generates a new apple if one has been eaten
function[apple] = appleGeneration(snake, apple, obstacle, gameBoardLength)
    %Generates a new randomly positioned apple while checking that it is not generated in the same cell as anything else
    generatedApplePass = false;
    %If the apple passes the checks the loop will break, otherwise a new apple will be generated
    while generatedApplePass == false
        %If the apple passes the checks the loop will break, otherwise a new apple will be generated
        generatedApplePass = true;
        %Generates random positions for new apple that are not on the border
        appleXPosition = 1 + randi(gameBoardLength);
        appleYPosition = 1 + randi(gameBoardLength);
        %Concatenes new apple posiiton onto matrix containg all apple positions
        apple = [apple; appleYPosition appleXPosition];
        
        %Nested loop to see if snake collides with an apple, as the previous collision was deleted this will not trigger from the same case
        %For the amount of elements/rows in snake and apple
        for snakeRow = 1:size(snake, 1)
            for appleRow = 1:size(apple, 1)
                %Compares every row in both matrices
                %If two of the rows are the same, the apple does not pass the checks and will end up generating a new apple
                if isequal(snake(snakeRow, :), apple(appleRow, :))
                    generatedApplePass = false;
                    break
                end
            end
        end
        %Nested loop to see if an obstacle collides with an apple, as having them on the same sqaure will break the functionality of the code
        %For the amount of elements/rows in obstacle and apple
        for obstacleRow = 1:size(obstacle, 1)
            for appleRow = 1:size(apple, 1)
                %Compares every row in both matrices
                %If two of the rows are the same, the apple does not pass the checks and will end up generating a new apple
                if isequal(obstacle(obstacleRow, :), apple(appleRow, :))
                    generatedApplePass = false;
                    break
                end
            end
        end
        %Nested loop to see if an apple collides with another apple, as having two apples in the same cell will result in there being one less total apple
        %For the amount of elements/rows in apple compared to the amount of elements/rows in apple
        for appleRow = 1:size(apple, 1)
            for appleRow2 = 1:size(apple, 1)
                %Compares every row in both matrices
                %Checks if row is equal to another but not same row
                %If two of the rows are the same, the apple does not pass the checks and will end up generating a new apple
                if isequal(apple(appleRow, :), apple(appleRow2, :)) && appleRow ~= appleRow2
                    generatedApplePass = false;
                    break
                end
            end
        end
    end
end