# NFL Contracts Database

### Description
This database provides detailed tracking of NFL player contracts. It currently includes baseline data for the 2024 season and is regularly expanded with new player and team information.

### Current Datapoints
- Player profiles (age, experience, position)
- Contract details (total value, guaranteed money, cap hit)
- Team salary cap information

### Data Sources
- **Contract data**: Sourced from [OverTheCap.com](https://overthecap.com) and [Spotrac.com](https://spotrac.com)
- **Player information**: Sourced using [Pro-Football-Reference.com](https://pro-football-reference.com)

### Technologies Used
- PostgreSQL
- Tableau (data visualization)

### Planned Updates
- Addition of historical contract data
- Addition of more comprehensive contract data

### Database Structure

The database is organized into several key tables:

1. **Players**
   - **player_id** (Primary Key)
   - **name**: Player's full name
   - **position**
   - **age**
   - **college**: Last school attended prior to entering the NFL
   - **experience_years**
   - **draft_pick**
   - **current_team_id**: (Foreign Key to Teams) Links to the player's current team
   - **height**
   - **weight**

2. **Teams**
   - **team_id** (Primary Key): Unique identifier for each team.
   - **team_name**
   - **city**
   - **division**
   - **conference**
   - **cap_space**

3. **Contracts**
   - **contract_id** (Primary Key): Unique identifier for each contract.
   - **player_id** (Foreign Key to Players): Links to the player who signed the contract.
   - **team_id** (Foreign Key to Teams): Links to the team that signed the contract.
   - **total_value**
   - **guaranteed_money**
   - **signing_bonus**
   - **roster_bonus**
   - **workout_bonus**
   - **base_salary**
   - **cap_hit**
   - **dead_cap**
   - **start_year**
   - **end_year**
   - **opt_out_year**
   - **injury_guarantee**
   - **performance_bonus**
   - **team_option_years**
   - **player_option_years**
   - **prorated_bonus**
   - **no_trade_clause**
   - **average_per_year**
   - **average_guarantee_per_year**
   - **position**
   - **is_active**: Is the contract still active today?

4. **Salary_cap**
   - **cap_id** (Primary Key): Unique identifier for each year.
   - **current_cap**: Annual NFL cap for the season
   - **year**
  
5. **Free_Agents**
   - **free_agent_id** (Primary Key)
   - **player_id** (Foreign Key to Players)
   - **last_team_id** (Foreign Key to Teams)
   - last_contract_value
   - last_contract_years
   - last_contract_end_year
   - age
   - asking_value
   - asking_years

6. **Dead_Money**
   - **dead_money_id** (Primary Key)
   - **player_id** (Foreign Key to Players)
   - **team_id** (Foreign Key to Teams)
   - **contract_id** (Foreign Key to Contracts)
   - dead_money_amount
   - dead_money_year

