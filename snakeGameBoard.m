%This functions takes in the desired gameBoardLength as an input and returns the gameBoard and some of its properties
function[gameBoardTrueLength, gameBoardSize, gameBoard] = snakeGameBoard(gameBoardLength)    
    %Adds 2 to the gameBoardLength for the border
    gameBoardTrueLength = gameBoardLength + 2;
    %Defines the amount of rows and columns in the gameBoard
    gameBoardSize = [gameBoardTrueLength, gameBoardTrueLength];
    %Using the matlab zeros function to create the gameBoard where all cells have a zero as a placeholder
    gameBoard = zeros(gameBoardSize);
end