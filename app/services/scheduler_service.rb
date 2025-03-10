class SchedulerService
    def initialize(players)
      @players = players.sort_by(&:skill_level) # Sort players by skill level
      @games = []
    end
  
    def generate_schedule
      return "Not enough players" if @players.size < 16
  
      match_schedule = MatchSchedule.create!(date: Date.today)
  
      grouped_players = group_players
  
      (1..3).each do |game_number|
        grouped_players.each do |group|
          create_game(match_schedule, group, game_number)
        end
        rotate_players(grouped_players)
      end
  
      match_schedule.games
    end
  
    private
  
    def group_players
      @players.each_slice(4).to_a
    end
  
    def rotate_players(groups)
      last_group = groups.pop
      groups.unshift(last_group)
    end
  
    def create_game(match_schedule, players, game_number)
      Game.create!(
        match_schedule: match_schedule,
        player_1: players[0],
        player_2: players[1],
        player_3: players[2],
        player_4: players[3],
        game_number: game_number
      )
    end
  end
  