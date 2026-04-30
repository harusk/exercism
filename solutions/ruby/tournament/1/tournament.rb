module Tournament
  SPACES = 31
  HEADER = "#{"Team".ljust(SPACES)}| MP |  W |  D |  L |  P\n"
  def self.tally(tournament_input)
    tournament_array = Array.new
    team_names = Array.new
    team_scores = Array.new

    tournament_input = tournament_input.split("\n") # Separate input regardless how many newlines are.
    tournament_input.each { |match| tournament_array.push(match.split(';')) }
    tournament_array.each do |match|
      for i in 0..1
        unless team_names.include? match[i]
          team_names.push(match[i])
          team_scores.push([0,0,0,0,0])
        end
      end
    end
    team_names.sort!
    tournament_array.each do |match|
        if match[2] == "draw"
          first_team = team_names.find_index(match[0])
          second_team = team_names.find_index(match[1])
          [first_team,second_team].each do |team|
            for i in [0,2,4]
              team_scores[team][i] += 1
            end
          end
        else
          if match[2] == "win"
            winner_team = 0
            loser_team = 1
          elsif match[2] == "loss"
            winner_team = 1
            loser_team = 0
          end
          winner_team_index = team_names.find_index(match[winner_team])
          loser_team_index = team_names.find_index(match[loser_team])
          team_scores[winner_team_index][0] += 1
          team_scores[winner_team_index][1] += 1
          team_scores[winner_team_index][4] += 3
          team_scores[loser_team_index][0] += 1
          team_scores[loser_team_index][3] += 1
        end
    end
    # Sorting teams
    push_index = 0
    team_scores.map do |score_result|
      score_result.insert(0,team_names[push_index])
      push_index += 1
    end

    team_results = Array.new
    until team_scores.empty?
      higgest_score = team_scores[0]
      team_scores.each do |team|
        if team[5] > higgest_score[5]
          higgest_score = team
        end
      end
      team_results.push(higgest_score)
      team_scores.delete(higgest_score)
    end

    output = "#{HEADER}"
    team_results.each do |results|
      output += "#{results[0].ljust(SPACES)}| #{results[1].to_s.rjust(2)} | #{results[2].to_s.rjust(2)} | #{results[3].to_s.rjust(2)} | #{results[4].to_s.rjust(2)} | #{results[5].to_s.rjust(2)}\n"
    end
    output
  end
end
