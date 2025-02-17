#!/bin/bash
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1))
echo $RANDOM_NUMBER
echo "Enter your username:"
read USERNAME
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
USER_ID=$($PSQL "select game_id from number_guess_game where username='$USERNAME' ")

if [[ -z $USER_ID ]]
then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ENTER_USER=$($PSQL "insert into number_guess_game(username) values('$USERNAME') ")
    GAMES_PLAYED=0
    BEST_GAME=0
else
    GAMES_PLAYED=$($PSQL "select games_played from number_guess_game where game_id=$USER_ID ")
    BEST_GAME=$($PSQL "select best_game from number_guess_game where game_id=$USER_ID ")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."    

fi

echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED
NUMBER_OF_GUESSES=1


while [ $NUMBER_GUESSED != $RANDOM_NUMBER ]  
do
  
  if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$  ]]
  then
      echo "That is not an integer, guess again:"
      read NUMBER_GUESSED
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
  else
      if (( $NUMBER_GUESSED > $RANDOM_NUMBER ))
      then
          echo "It's lower than that, guess again:"
          read NUMBER_GUESSED
          NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      fi

      if (( $NUMBER_GUESSED < $RANDOM_NUMBER ))
      then
          echo "It's higher than that, guess again:"
          read NUMBER_GUESSED
          NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      fi
          
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
GAMES_PLAYED=$GAMES_PLAYED+1

if [[ $BEST_GAME -eq 0 && $GAMES_PLAYED -eq 1 ]]
then
    BEST_GAME=$NUMBER_OF_GUESSES
fi

if [[ $BEST_GAME > $NUMBER_OF_GUESSES && $GAMES_PLAYED > 1 ]]
then
    BEST_GAME=$NUMBER_OF_GUESSES
    
fi

INSERT_VALUES=$($PSQL "update number_guess_game set best_game=$BEST_GAME, games_played=$GAMES_PLAYED where username='$USERNAME' ")