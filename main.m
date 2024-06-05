%Main function that runs all the code
function main() 
    %Clearing the workspace and command window
    clc;
    clear;
    
    %Initialisng exit variable and highscore
    exit = 'N';
    highscore = 0;

    %Asking the user if the want to view the instructions
    helpWanted = input('Do you want to view the instrictions (Y/N): ', 's');
    
    %Using the logic the instructions will only run if the user says they want help, and will not accidentally show it due to a misinput
    if helpWanted ~= 'N'
        instructions()
    end
    
    %Loop will continue until condition has been met
    while true
        %Asks for user input
        gameBoardLength = input('How many cells do you want the length of the gameboard to be? ', 's');
        %Attempts to convert string input to a number
        %If it can not be converted gameBoardLength will be empty, so it will ask you to enter a valid number
        if isempty(str2num(gameBoardLength))
            disp('Please enter a valid number.');
        %Checks that the size of the game board is reasonable
        elseif str2num(gameBoardLength) < 20 || str2num(gameBoardLength) > 50
            disp('Please enter a number between 20 and 50')
        %If it passes both checks it converts gameBoardLength to a number
        else
            gameBoardLength = str2num(gameBoardLength);
            break;
        end
    end

    fprintf('\nPlease enter a speed that is between 1 and 10\n')
    %Loop will continue until condition has been met
    while true
        %Asks for user input
        tickSpeed = input('What do you want the speed to be? ', 's');
        %Attempts to convert string input to a number
        %If it can not be converted tickspeed will be empty, so it will ask you to enter a valid number
        if isempty(str2num(tickSpeed))
            disp('Please enter a valid number.');
        %Checks that the speed of the game is reasonable
        elseif str2num(tickSpeed) < 1 || str2num(tickSpeed) > 10
            disp('Please enter a number between 1 and 10')
        %If it passes both checks it converts tickSpeed to a number
        else
            %The higher the number inputed, the smaller the tickspeed and the faster the program runs
            tickSpeed = (0.01/str2num(tickSpeed));
            break;
        end
    end

    while exit == 'N'
        score = snakeGame(gameBoardLength, tickSpeed);
        
        %Closes the game
        close;
        
        %Prints the score
        fprintf('Congratulations, you achieved a score of %d in the game\n', score)

        if score > highscore
            highscore = score;
            disp('Congratulations! You beat the high score')
        elseif score == highscore
            disp('Congrats! You tied with the high score')
        else
            fprintf('Try again to beat the high score of %d\n', highscore)
        end

        %Asking the user if the want to exit
        exit = input('Do you want to exit (Not Play Again) (Y/N): ', 's');
    end
end