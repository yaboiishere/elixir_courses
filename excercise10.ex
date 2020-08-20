defmodule Football do
  # Football.play(["Red", "Blue"], [2,1])
  def play([first_team, second_team], [first_score, second_score]) do
    teams = %{
      "Red" => %{
        "gk" => {"Jody Reeves", 28, "right", 0},
        "def" => {"Kevin Martinez", 34, "right", 0},
        "mid" => {"Melvin Montgomery", 22, "left", 0},
        "atk" => {"Ramon Stokes", 35, "right", 0}
      },
      "Blue" => %{
        "gk" => {"Boyd Morris", 48, "left", 0},
        "def" => {"Nicholas Thomas", 42, "left", 0},
        "mid" => {"Blake Bradley", 18, "right", 0},
        "atk" => {"Guadalupe Tran", 32, "left", 0}
      },
      "Green" => %{
        "gk" => {"Clayton Love", 22, "left", 0},
        "def" => {"Dennis Rodgers", 25, "left", 0},
        "mid" => {"Rick Mcdaniel", 33, "right", 0},
        "atk" => {"Roosevelt Carson", 20, "left", 0}
      }
    }
    if first_score < second_score do
      #Swap so winners are first
      [_first_team, _second_team] = [second_team, first_team]
      [_first_score, _second_score] = [second_score, first_score]
      #The _ silence the warnings and it still works
    end
    with {:ok, first_players} <- Map.fetch(teams, first_team),
    {:ok, second_players} <- Map.fetch(teams, second_team) do
      get_team1 = Task.async(fn -> update_players(first_players, first_score, second_score) end)
      get_team2 = Task.async(fn -> update_players(second_players, second_score, first_score) end)
      teams = %{teams | first_team => Task.await(get_team1)}
      teams = %{teams | second_team => Task.await(get_team2)}

    end
  end

  def update_players(players, done, got) do
    for {k,v = {name, age, handedness, score}} <- players, into: %{} do
      case k do
        "gk" -> { k, {name, age, handedness, score-got}}
        "def" -> if done > 3, do: { k, {name, age, handedness, score + (done-3)}}, else: {k, v}
        "mid" -> if done > 2, do: { k, {name, age, handedness, score+1}}, else: {k, v}
        "atk" ->
          case done do
            0 -> { k , v}
            1 -> { k , {name, age, handedness, score+1}}
            _ -> { k , {name, age, handedness, score+2}}
          end
      end
    end
  end

end


# defmodule Aq do
#   There must be a function to which a country name should be passed as an argument.
# On the screen there should be all of the current measurements in that country,
# and the city with the highest and lowest measurement value.
# Processes, tasks or agents shall be used. The code structure and the way of implementation are fluid.
# For ease use these dependencies:
# https://hex.pm/packages/httpoison - for http requests
# https://hex.pm/packages/jason - for jason encoding and decoding

# *You can use any dependency of your liking as long as it has the needed functionality.*
# *The lack of usage of dependencies can be used only when new free of dependency implementation is wanted by the student.*

# Additional literature: https://www.poeticoding.com/spawning-processes-in-elixir-a-gentle-introduction-to-concurrency/
end
