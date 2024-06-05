%This functions generates the initial positions of the snake and the apple
function[snake, apple, obstacle] = initialPositions(gameBoardLength)
    %Determing ths starting position of the snake to the middle of the board
    initialSnakePosition = 1 + round(gameBoardLength/2);
    %Defining an array which contains every position which the snake is occupying
    %Storing the initial position in that array
    snake = [initialSnakePosition initialSnakePosition];
    
    %Initialises apple as a copy of snake to fit the condition of the following while loop
    apple = snake;
    %Keeps Generating new initialApplePositions unti they are not situated in the same cell as snake
    while apple == snake
        %Randomly creating the starting position of the apple
        %Adding 1 to ensure its not generated within the border
        initialAppleXPosition = 1 + randi(gameBoardLength);
        initialAppleYPosition = 1 + randi(gameBoardLength);
        %Storing the position of the apple in a matrix for scalability, to include more apples if needed
        apple = [initialAppleYPosition initialAppleXPosition];
    end

    %Initialising Obstacle matrix that will hold the randomly generated positions for each obstacle
    obstacle = [];
end