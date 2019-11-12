# Test task Mogo Baltics and Caucasus

## Develop software that can be used to manage tournament scoring.

### User storyline:
1. Home screen: There is a list of all tournaments (name, status, winner, finalist). User can create new one, by entering tournament's name.
2. New tournament: There is list of all teams, and possibility to add new team.  User can choose 16 teams to participate in this tournament. After clicking start, teams are randomly split in two divisions.
3. Game view: There should be possible to see each game between teams. Each division separately. There should be button to generate results for all teams. When results is generated, start playoff. After playoff is started, playoff generation button should be visible. Regular seasons table example:

![alt text](./Games.jpg "Games example")￼

4. User can go back to index and to any tournament anytime in the program's lifecycle.

### Functional requirements:
1. Tournament names are unique. Tournament has status (draft, in_progress, done)
2. User can enter list of teams. Together 16 teams are participating. Also there should be possibility to generate random teams. It's not allowed to add one team to a tournament multiple times.
3. Teams by random are split in 2 divisions – A and B (8 teams in each).
4. In each division teams play each against other. Each game between teams should be saved into database.
5. The best 4 teams from each division meet in Play-off.
6. Play-off initial schedule is made by principle - best team plays against worst team.
7. The winning team stays to play further but the losing team is out of the game.
8. Overall winning team is the one who wins all games in play-off.
9. In order not to enter the tournament results by hand please use auto generation
10. Results must be saved in database

### Software should be developed on:
1. Ruby version 2.5.3
2. Rails 5.0 or newer.
3. Database engine MySql.
4. Ruby gemset name "tournament"
5. Rspec 3.7 or higer
6. Rubocop 0.76.0 with given [rubocop.yml](./rubocop.yml) file.

### Instructions on how to submit task
1. Clone project localy
2. Code task requirements
3. Commit changes and push back to gitlab
4. If you have any addtional instructions on how to setup you application, add it to new file INSTRUCTIONS.md
5. Send us an information via Email when task is done, we won't check task until it's done

*Please show your best knowledge of object-oriented programming, that includes business logic split through models and services.*
