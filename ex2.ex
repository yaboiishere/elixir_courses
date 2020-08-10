defmodule Test do

  def pattern_match_keyword_list() do
    keyword_list = [first_name: "Alice", age: 18]
    [{:first_name, first_name}, {:age, age}] = keyword_list
    IO.puts(first_name)
    IO.puts(age)

  end

  def pattern_match_on_maps() do
    tuple = {:ok, [%{first_name: "Alice", age: 18}, %{first_name: "Bob", age: 21}]}
    {:ok, list} = tuple
    [first, second] = list
    %{age: age, first_name: first_name} = first
    %{age: second_age, first_name: second_first_name} = second
    IO.inspect(first)
    IO.inspect(second)
    IO.inspect(age)
    IO.inspect(first_name)
    IO.inspect(second_age)
    IO.inspect(second_first_name)
  end

end
