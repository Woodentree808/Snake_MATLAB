%This is the snakeGame function, which runs other functions to let the user play
function[score] = snakeGame(gameBoardLength, tickSpeed)

    %This functions takes in the desired gameBoardLength as an input and returns the gameBoard and some of its properties
    [gameBoardTrueLength, gameBoardSize, gameBoard] = snakeGameBoard(gameBoardLength);    
    
    %This functions generates the initial positions of the snake and the apple
    [snake, apple, obstacle] = initialPositions(gameBoardLength);

    %Snake direction initialised to go towards the right
    %This can be represented by increasing the x coordinate, or column by 1
    snakeDirection = [0 1];

    %Score initialised and set to 0, will increase every time an apple is eaten
    score = 0;
    
    %After researching how to use arrow key inputs in Matlab, the KeyPressFcn was discovered
    %MATLAB documentation was used to determine how to use it

    %Figure creates a window that is not visible, as it does not have any properties that make it so that are defined
    %By using its property KeyPressFcn, a callback function is specified that will be executed when a key is pressed
    %The @ symbol is used to refer to the function without actually executing it

    figure('KeyPressFcn', @snakeDirectionChange);
    %The function snakeDirectionChange is defined with two inputs and one return ouptut
    %filler is not used in the code and instead stores the 'handle' of the figure, which is a reference to the figure
    %key represents the event object that contains the information about the event that triggered the callback function
    function snakeDirectionChange(filler,key)
        %key.character is property of key that contains the character associated with the pressed key
        switch key.Character
            %The left arrow key has a keycode of 28 in Matlab
            case 28
                if snakeDirection ~= [0 1];
                    snakeDirection = [0 -1];
                end
            %The right arrow key
            case 29
                if snakeDirection ~= [0 -1];
                    snakeDirection = [0 1];
                end
            %The up arrow key
            case 30
                if snakeDirection ~= [1 0];
                    snakeDirection = [-1 0];
                end
            %The down arrow key
            case 31
                if snakeDirection ~= [-1 0];
                    snakeDirection = [1 0];
                end
        end
    end
    
    %Initialising the variable that will be used as the exit variable in the following code
    fatalCollision = false;
    
    %This loop will run forever while the exit condition is false
    %The loop displays the game snake, while making any modifications to it based on user input or occurences within the game
    %fatalCollision will equal true when the snake collides with the border or itself
    while fatalCollision == false
        
        %Refreshes the gameBoard to a blank state every iteration, so that the new game state can be displayed
        gameBoard = zeros(gameBoardSize);
        
        %Updates the gameboard to represent the positions of every item
        gameBoard = updateGameBoard(gameBoard, gameBoardTrueLength, snake, apple, obstacle);    
        
        %Displaying the array using the Matlab image related functions
        gameBoardDisplay(gameBoard, gameBoardTrueLength)

        %Checking if the snake is colliding with an apple, the border or itself
        [apple, obstacle, score, appleCollision, fatalCollision] = collision(snake, apple, obstacle, score, gameBoardLength, gameBoardTrueLength);

        %This function updates the matrix snake, by changing its position or making it grow
        [snake] = snakeUpdate(snake, snakeDirection, appleCollision);
        
        %Tickspeed represents the refresh rate of the code in seconds, allowing it to be playable as the snake moves
        %Used to delay the program so user has time to input and process the information
        pause(tickSpeed);
    end
end

