defmodule Homework do
  #Write a function which takes one argument. If the argument is a list, print on the screen
  #"The argument is a list, its first agument is #{arg1}", where arg1 is the
  #first element of the list. If the argument is a tuple, print "The argument is a tuple" transform it
  #to a list and print on the screen "The argument is a list, its first argument is #{arg1}"
  #without writing another IO function. Handle the empty list appropriately. If it is a map,
  #transform it into a list and print the same message. For ease the map structure should be %{a: 1}.

  #!!! Bonus: Make the function to work with maps, whose keys are strings. %{"a" => 1}
  def check(list) when is_list(list) do
    IO.puts("The argument is a list, its first agument is #{List.first(list)}")
  end

  def check(tuple) when is_tuple(tuple) do
    list_first = List.  first(Tuple.to_list(tuple))
    IO.puts("The argument was a tuple. The argument was changed to a list, its first agument is #{list_first}")
  end

  def check(map ) when is_map(map) do
    #Homework.check(%{"a" => 2, "b" => 3})
    list = Map.to_list(map)
    List.first(list)
  end

  def check(list) when is_nil(list) do
    "The argument is nil"
  end


  #The nested list [1, [2, 3], 4] is given. Exercises:
  # match 1 from the nested_list
  # match 2 from the nested_list
  def match1() do
    [a, _ , _] = [1, [2, 3], 4]
    a
  end

  def match2() do
    [_, [a, _], _] = [1, [2, 3], 4]
    a
  end

  #Write a function that adds 1 to every element in the list.
  # The elements are numeric values (integer, float).
  def add1() do
    Enum.map([2,3,4,5,6], fn(el)->
      el+1
    end)
  end

  #Write a function that calculates the perimeter of a triangle. It should work
  #if the side's lengths are passed as separate arguments, in a tuple, in a list, or in a map.
  #Example of map structure: %{a: value_a, b: value_b, c: value_c}
  def perim(args) do

    case args do
      {a, b, c} ->
        a+b+c
      [a, b, c] ->
        a+b+c
      %{a: a, b: b, c: c} ->
        a+b+c
      _ ->
        "Please enter a valid structure"
    end
  end

  #Given a list [%{name: “Tom”, age: 14}, %{name: “Jerry”, age: 21}, %{name: “Donald”, age: 18}],
  #return the following list: [“Tom: 14 years old”, “Jerry: 21 years old”, “Donald: 18 years old”]

  #Given the list from the previous task, made an additional case for when the age is “1”,
  # then it should output “: 1 year old”
  def stringify(list \\ [%{name: "Tom", age: 1}, %{name: "Jerry", age: 21}, %{name: "Donald", age: 18}]) do
    Enum.map(list, fn(el) ->
      # case el do
      #   %{name: _, age: age} when age == 1 ->
      #     "#{el.name}: 1 year old"
      #   %{name: _, age: age} ->
      #     "#{el.name}: #{el.age} years old"
      # end
      cond do
        el.age == 1 ->
          "#{el.name}: 1 year old"
        el.age >1 ->
          "#{el.name}: #{el.age} years old"
        true -> "Please input a valid number"
      end
    end)
  end


  def no_a(list \\ ["An example sentence", "Another sentence", "Third sentence"]) do
    Enum.reject(list, fn(el)->
      String.contains?(String.downcase(el), "a")
    end)
  end
end
