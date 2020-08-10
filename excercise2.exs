#Which of the following will match:
# a = [1, 2, 3] match
# a = 4 match
# 4 = a no match
# [a, b] = [ 1, 2, 3 ] no match
# a = [ [ 1, 2, 3 ] ] no match
# [a] = [ [ 1, 2, 3 ] ] match
# [[a]] = [ [ 1, 2, 3 ] ] no match
# [x, x] = [1, 1] match
# [x, x] = [2, 3] match
# [x, _, x] = [2, 3] no match
# [x, z, x] = [2, 3, 2] match
# [x, 3, x] = [2, 3, 2] match

# [{key, value}] = [key1: "value"] match
# is this valid -> `[{key: "pair"}, {fruit: apple}]` no


# %{person => [home]} = %{%{"user" => ["color", "tuple", "hobby"]} => "address"} no match
# %{team: points} = %{"points" => 4} no match
# %{team: 4} == %{"points" => 4} match


#Write a pattern to get “Alice” in variable named first_name, and 18 in variable named age from the following structure:

[first_name: first_name,age: age] = [first_name: "Alice", age: 18]

IO.puts first_name
IO.puts age


#Write a pattern to get the same things from the following structure:
tuple = {:ok, [%{first_name: "Alice", age: 18}, %{first_name: "Bob", age: 21}]}
{:ok, list} = tuple
[first , second] = list
%{age: age, first_name: first_name} = first
%{age: second_age, first_name: second_first_name} = second
IO.inspect(first)
IO.inspect(second)
IO.inspect(age)
IO.inspect(first_name)
IO.inspect(second_age)
IO.inspect(second_first_name)

# #Create functions that does the following:
# to_tuple.([2, 3], [4, 5])	[{2, 3}, {4, 5}]
# to_tuple2.([2, 3], [4, 5])	[{2, 4}, {3, 5}]
# to_keyword_list.({:a, :b, :c}, {1, 2, 3})	[a: 1, b: 2, c: 3]

to_tuple = fn list1, list2 ->
  [List.to_tuple(list1), List.to_tuple(list2)]
end
to_tuple.([2, 3], [4, 5])


to_tuple2 = fn(list1, list2) ->
  [x, y] = list1
  [a, b] = list2

  [List.to_tuple([x, y+1]), List.to_tuple([a-1, b])]
end

to_tuple2.([2, 3], [4, 5])

to_keyword_list = fn(keys, vals) ->
  Enum.zip([Tuple.to_list(keys),Tuple.to_list(vals)])
end

to_keyword_list.({:a, :b, :c}, {1, 2, 3})

#Write a function that checks if list is empty. It should return “true” if it is, and “false” otherwise.

defmodule Test do
  def is_empty?(list) when is_nil(list), do: true
  def is_empty?(list), do: false

end

#Create a tuple consisting of an atom “:ok” and string “Alice”. Pattern match the string in a variable “first_name”
new_tuple = {:ok, "Alice"}
{_,first_name} = new_tuple

#Create a function which receives a tuple consisting of three elements, an atom, an integer and a string. Create a pattern to match the integer and the string from tuple argument in variables named “age” and “first_name” Make the pattern match only if the atom has a value “:ok”

defmodule Test2 do
    #Not with guard, because it seems redundant
    def match(tuple) do
        {:ok, age, first_name} = tuple
    end

end
