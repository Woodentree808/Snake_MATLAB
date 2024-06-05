%This function checks if the snake is colliding with an apple, the border or itself
function[apple, obstacle, score, appleCollision, fatalCollision] = collision(snake, apple, obstacle, score, gameBoardLength, gameBoardTrueLength)
    %Defining fatalCollision so the function can return it if it does not become true in this function
    fatalCollision = false;
    %Resetting appleCollision to false so the program does not constantly think the apple is being collided with
    appleCollision = false;
    %Nested loop to see if snake collides with an apple
    %For the amount of elements/rows in snake compared to the amount of elements/rows in apples
    for snakeRow = 1:size(snake, 1)
        for appleRow = 1:size(apple, 1)
            %Compares every row in both matrices by seeing if they are equal
            if isequal(snake(snakeRow, :), apple(appleRow, :))
                %If they are equal sets appleCollision to be true
                %This variable is checked later to see if the size of the snake needs to increase or a new apple needs to be generated
                appleCollision = true;
                %Increases score by 1 every time an apple is eaten
                score = score + 1;
                %Deletes apple that has been collided with as it has been consumed by the snake
                apple(appleRow, :) = [];
                % Exit inner loop if collision is detected to not waste time, asthe snake would only be colliding with one apple at a time
                break;
            end
        end
        %Generates a new randomly postioned apple and breaks loop if collision with apple
        if appleCollision == true
            %Function that generates a new apple
            [apple] = appleGeneration(snake, apple, obstacle, gameBoardLength);
            %Function that generates a new obstacle
            [obstacle] = obstacleGeneration(snake, apple, obstacle, gameBoardLength);
            %Exit outer loop if collision is detected
            break;
        end
    end

    %Nested loop to see if snake collides with border
    %For the amount of elements/rows in snake
    for snakeRow = 1:size(snake, 1)
        %Checks if snake row is positioned on a border
        if snake(snakeRow, 1) == 1 || snake(snakeRow, 1) == gameBoardTrueLength || snake(snakeRow, 2) == 1 || snake(snakeRow, 2) == gameBoardTrueLength
            %Changes exit condition to exit the snakeGame program
            fatalCollision = true;
        end
    end

    %Nested loop to see if snake collides with self
    %For the amount of elements/rows in snake compared to the amount of elements/rows in snake
    for snakeRow = 1:size(snake, 1)
        for snakeRow2 = 1:size(snake, 1)
            %Compares every row in both matrices
            %Checks if row is equal to another but not same row
            if isequal(snake(snakeRow, :), snake(snakeRow2, :)) && snakeRow ~= snakeRow2
                %Changes exit condition to exit the snakeGame program
                fatalCollision = true;
                break;
            end
        end
    end

     %Nested loop to see if snake collides with obstacle
     %For the amount of elemtents/rows in snake compared to the amount of elements/rows in obstacles
     for snakeRow = 1:size(snake, 1)
         for obstacleRow = 1:size(obstacle, 1)
             %Checks if row is equal to another
             %Compares every row in both matrices
             if isequal(snake(snakeRow, :), obstacle(obstacleRow, :))
                 fatalCollision = true;
                 break;
             end
         end
     end
end