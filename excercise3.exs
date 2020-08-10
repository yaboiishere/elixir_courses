defmodule Test do
  #You have a map with the following structure: %{first_name: "Alice", second_name: "Hemingway", age: 20}
  #Write a function, that when receives that map, returns the string “Hello, Alice Hemingway!”
  def break_down_map() do
    map = %{first_name: "Alice", second_name: "Hemingway", age: 20}
    "Hello, #{map.first_name} #{map.second_name}!"
  end

  #Create a function “length_of_tuple”, that returns the number of elements in a tuple. If they are more than 4, return the string “Shouldn’t you use list?”
  def length_of_tuple(tuple) when tuple_size(tuple) < 5 do
    tuple_size(tuple)
  end
  def length_of_tuple(tuple), do: "Shouldn’t you use list?"


  #Given a list of years: [1994, 600, 1965, 0, 1, 2019, 2008, 1921, 1936, 1414, 2000, 1992, 2004],
  # using Enum.filter remove every year, that is not from the 21st century

  def years(list \\ [1994, 600, 1965, 0, 1, 2019, 2008, 1921, 1936, 1414, 2000, 1992, 2004]) do
    Enum.filter(list, fn(el) ->
      el>2000 and el<2101
    end)
  end

  #You have the numbers from 1 to 100, using pipe, select all the even number, excluding 100.
  # Then from that list, remove the numbers divisible by 3.
  # Then multiply every second number by 100. Use ranges!
  def pipe(list \\ 1..100) do
    list
    |>Enum.filter(fn(el)->
      rem(el,2) == 0 and el != 100
    end)
    |>Enum.filter(fn(el)->
      rem(el,3) != 0
    end)
    |>Enum.drop_every(2)
  end

  #Given a list: [%{name: "Donald", age: 10}, %{name: "Jerry", age: 21}, %{name: "Tom", age: 24}]
  # remove everyone, that should not be allowed to drink alcohol
  def bouncer(map \\ [%{name: "Donald", age: 10}, %{name: "Jerry", age: 21}, %{name: "Tom", age: 24}]) do
    map
    |> Enum.filter(fn(el)->
      el.age >= 18
    end)
  end


end
