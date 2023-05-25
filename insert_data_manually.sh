
if [[ $1 == test ]]
then
  PSQL=psql --username=postgres --dbname=worldcuptest -t --no-align -c
else
  PSQL=psql --username=freecodecamp --dbname=worldcup -t --no-align -c
fi

# Do not change code above this line. Use the PSQL variable above to query your database.



echo $($PSQL TRUNCATE table teams RESTART IDENTITY CASCADE)
#insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$year', '$round', $WINNERID, $OPPONENTID, '$winner_goals', '$opponent_goals'))

## manual import because of codeally timeouts httpsforum.freecodecamp.orgtsubtasks-1-1-before-all-hook-for-1-worldcup-database-should-exist60145417
echo $($PSQL insert into teams(name) values ('Algeria'),('Argentina'),('Belgium'),('Brazil'),('Chile'),('Colombia'),('Costa Rica'),('Croatia'),('Denmark'),('England'),('France'),('Germany'),('Greece'),('Japan'),('Mexico'),('Netherlands'),('Nigeria'),('Portugal'),('Russia'),('Spain'),('Sweden'),('Switzerland'),('United States'),('Uruguay'))

echo $($PSQL insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values (2018, 'Final', 11, 8, 4, 2),(2018, 'Third Place', 3, 10, 2, 0),(2018, 'Semi-Final', 8, 10, 2, 1),(2018, 'Semi-Final', 11, 3, 1, 0),(2018, 'Quarter-Final', 8, 19, 3, 2),(2018, 'Quarter-Final', 10, 21, 2, 0),(2018, 'Quarter-Final', 3, 4, 2, 1),(2018, 'Quarter-Final', 11, 24, 2, 0),(2018, 'Eighth-Final', 10, 6, 2, 1),(2018, 'Eighth-Final', 21, 22, 1, 0),(2018, 'Eighth-Final', 3, 14, 3, 2),(2018, 'Eighth-Final', 4, 15, 2, 0),(2018, 'Eighth-Final', 8, 9, 2, 1),(2018, 'Eighth-Final', 19, 20, 2, 1),(2018, 'Eighth-Final', 24, 18, 2, 1),(2018, 'Eighth-Final', 11, 2, 4, 3),(2014, 'Final', 12, 2, 1, 0),(2014, 'Third Place', 16, 4, 3, 0),(2014, 'Semi-Final', 2, 16, 1, 0),(2014, 'Semi-Final', 12, 4, 7, 1),(2014, 'Quarter-Final', 16, 7, 1, 0),(2014, 'Quarter-Final', 2, 3, 1, 0),(2014, 'Quarter-Final', 4, 6, 2, 1),(2014, 'Quarter-Final', 12, 11, 1, 0),(2014, 'Eighth-Final', 4, 5, 2, 1),(2014, 'Eighth-Final', 6, 24, 2, 0),(2014, 'Eighth-Final', 11, 17, 2, 0),(2014, 'Eighth-Final', 12, 1, 2, 1),(2014, 'Eighth-Final', 16, 15, 2, 1),(2014, 'Eighth-Final', 7, 13, 2, 1),(2014, 'Eighth-Final', 2, 22, 1, 0),(2014, 'Eighth-Final', 3, 23, 2, 1))

