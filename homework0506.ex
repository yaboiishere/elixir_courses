defmodule John do

# John is a regular bulgarian, whose responses are quite limited. If you ask him a question he says "Eurofootball matches haven't gone out.".
#  If you yell(caps lock) at him, he tells you to "Shut up.". If you yell a question he says "Only the weak shout.". If you dont tell him anything he says "Yo.".
#   If you tell him anything different he says "K".
# Write a function/functions which implement his behavior. Bonus: Use conditional operators.
  def talk(), do: "Yo."
  def talk(str) when is_nil(str) or str == "", do: "Yo."
  def talk(str) do
    cond do
      str == String.downcase(str) or str == String.capitalize(String.downcase(str)) ->
            case String.last(str) do
              "?" -> "Eurofootball matches haven't gone out."
              _ -> "K."
            end
      str == String.upcase(str) ->
            case String.last(str) do
              "?" -> "Only the weak shout."
              _   -> "Shut up."
            end
      true ->
           case String.last(str) do
              "?" -> "Eurofootball matches haven't gone out."
              _   -> "K."
            end
    end
  end
end


defmodule Ex do
  #Write a function which takes a string as an argument, checks it's length and if it is grater than 9, returns "long string", in other case "short string".
  def ex3(str) do
    cond do
      String.length(str) > 9 -> "long string"
      true -> "short string"
    end
  end
 # Write a function that compares two strings and returns message about which string is longer or if they are equal.
 def ex4(str1, str2) do
    cond do
      String.length(str1) > String.length(str2) -> "#{str1} is longer than #{str2}"
      String.length(str1) < String.length(str2) -> "#{str2} is longer than #{str1}"
      String.length(str1) == String.length(str2) -> "#{str1} is equal to #{str2}"
      true -> "An error occurred"
    end
 end

 def ex5(list) when is_list(list) do
   Kernel.inspect(List.first(list))
 end
 def ex5(_list), do: ""

#  Write a function that, receive two parameters

# if the second parameter is greater than 1, the returned value is the second parameter
# if the first argument is equal to three, the returned value is the second parameter
# if the first argument is greater than 4, the returned values is "ok"
  def ex6(_x, y) when y > 1, do: y
  def ex6(x, y) when x==3, do: y
  def ex6(x, _y) when x > 4, do: "ok"
  def ex6(_x, _y), do: "Not yet implemented"


#  Write a function, that:
# If it receives a tuple with three elements and the second is greater than 1, it should return the second element.
# If it receives a tuple with two elements and the first equals 3, it should return the second element.
# If it receives a tuple with one elemnt and it is greater than 4, it should the return the element.
  def ex7({_x, y, _z}) when y>1, do: y
  def ex7({x, y}) when x==3, do: y
  def ex7({x}) when x>4, do: x
  def ex7(tuple) when is_tuple(tuple), do: "Invalid tuple"
  def ex7(_tuple), do: "Please enter a tuple"

  #Write a function that takes a tuple as an argument, and using a conditional operator by your choice,
  # it should return the first element if it is greater than the second. In other case, the sum of the second and third.
  def ex8({x,y,_z}) when x>y, do: x
  def ex8({_x,y,z}), do: y+z
  def ex8(tuple) when is_tuple(tuple) do
    [x,y,z] = Enum.take(tuple, 3)
    cond do
      x>y -> x
      true -> y+z
    end
  end
  def ex8(_tuple), do: "Input a valid tuple"
end

# %{
#   "Red" => %{
#     "gk" => {"Jody Reeves", 28, "right", 0},
#     "def" => {"Kevin Martinez", 34, "right", 0},
#     "mid" => {"Melvin Montgomery", 22, "left", 0},
#     "atk" => {"Ramon Stokes", 35, "right", 0}
#   },
#   "Blue" => %{
#     "gk" => {"Boyd Morris", 48, "left", 0},
#     "def" => {"Nicholas Thomas", 42, "left", 0},
#     "mid" => {"Blake Bradley", 18, "right", 0},
#     "atk" => {"Guadalupe Tran", 32, "left", 0}
#   },
#   "Green" => %{
#     "gk" => {"Clayton Love", 22, "left", 0},
#     "def" => {"Dennis Rodgers", 25, "left", 0},
#     "mid" => {"Rick Mcdaniel", 33, "right", 0},
#     "atk" => {"Roosevelt Carson", 20, "left", 0}
#   }
# }
# "Red" beats "blue" 2-1 !
# %{
#   "Red" => %{
#     "gk" => {"Jody Reeves", 28, "right", -1},
#     "def" => {"Kevin Martinez", 34, "right", 0},
#     "mid" => {"Melvin Montgomery", 22, "left", 0},
#     "atk" => {"Ramon Stokes", 35, "right", 2}
#   },
#   "Blue" => %{
#     "gk" => {"Boyd Morris", 48, "left", -2},
#     "def" => {"Nicholas Thomas", 42, "left", 0},
#     "mid" => {"Blake Bradley", 18, "right", 0},
#     "atk" => {"Guadalupe Tran", 32, "left", 1}
#   },
#   "Green" => %{
#     "gk" => {"Clayton Love", 22, "left", 0},
#     "def" => {"Dennis Rodgers", 25, "left", 0},
#     "mid" => {"Rick Mcdaniel", 33, "right", 0},
#     "atk" => {"Roosevelt Carson", 20, "left", 0}
#   }
# }

# You have a structure containing a few football teams, write a function that takes the team names and result and updates the player's stats.
# Make the code to work even if the names of teams are changed or if there are more than two teams in the database. If the names of the teams are present in the struct,
# the match can be made. You are free to structure the code the way you want.

# Rules:

# if team scored 1 - goals is for atk
# if team scored 2 - 2 goals are for atk
# if a team scored 3 - 2 goals are for atk one for mid,
# if team scored 4 - 2 goals are for atk one for mid, one for def
# if team conceed a goal - gk is -1

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
      teams = %{teams | first_team => update_players(first_players, first_score, second_score)}
      teams = %{teams | second_team => update_players(second_players, second_score, first_score)}

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
