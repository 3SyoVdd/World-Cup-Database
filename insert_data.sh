#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


#echo $($PSQL "TRUNCATE table teams RESTART IDENTITY CASCADE")

cat games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals;
do
#echo "$($PSQL "SELECT * from teams")"



if [[ $winner != 'winner' ]]
then
TEAMFOUND="$($PSQL "select count(*) from teams where name = '$winner'")"
  if (( TEAMFOUND == 0 )) 
  then
    echo $winner nicht gefunden $TEAMFOUND
    echo $($PSQL "INSERT INTO teams(name) values ('$winner')")
  fi
fi

WINNERID=$($PSQL "select team_id from teams where name ='$winner'")

if [[ $opponent != 'opponent' ]]
then
TEAMFOUND="$($PSQL "select count(*) from teams where name = '$opponent'")"
  if (( TEAMFOUND == 0 )) 
  then
    echo $opponent nicht gefunden $TEAMFOUND
    echo $($PSQL "INSERT INTO teams(name) values ('$opponent')")
  fi
fi
 
OPPONENTID=$($PSQL "select team_id from teams where name ='$opponent'")  

echo scheissdress $OPPONENTID $WINNERID
#sqlstring="insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$year', '$round', $WINNERID, $OPPONENTID, '$winner_goals', '$opponent_goals')"
#echo $sqlstring

ergebnis="$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$year', '$round', $WINNERID, $OPPONENTID, '$winner_goals', '$opponent_goals')")"
done
