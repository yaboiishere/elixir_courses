defmodule Test do

  def pluralize(a) do
    if a>1 and is_number(a) do
      "people"
    else
      "person"
    end
  end

  def fizzbuzz(a, b, c) do

    case [a, b, c] do
      [0,0,_] -> "FizzBuzz"
      [0,1,_] -> "Fizz"
      [1,0,_] -> "Buzz"
      [_,_,x] -> x
    end

  end

  def strcmp(str1, str2) do
    if String.length(str1) > String.length(str2) do
      true
    else
      false
    end
  end

  def wonderful(str) do
    IO.puts "For the word #{str}, \"#{String.at(str, 2)}\" is the third letter and this is the word capitalized: #{String.capitalize(str)}"
  end

  def ihatehw(str) do
    if String.contains?(str, "hate") do
      big_string = "With dots: "
      big_string = big_string <> String.replace(str, " ", ".")


      tmp = List.replace_at(String.split(str), 1, "love")
      tmp = Enum.join(tmp, " ")
      reversed = String.reverse(tmp)
      big_string = big_string <> " and this is it reversed #{reversed}"
      IO.puts big_string

    end

  end

end


IO.puts Test.pluralize(2)
IO.puts Test.pluralize(1)
IO.puts Test.fizzbuzz(0,0,5)
IO.puts Test.fizzbuzz(0,1,2)
IO.puts Test.fizzbuzz(1,0,2)
IO.puts Test.fizzbuzz(1,1,"Test")

con = fn(str1, str2) ->
  str1<>str2
end

IO.puts con.("Str", "ing")


IO.puts Test.strcmp("1234", "12345")
IO.puts Test.strcmp("1234", "123")

IO.puts Test.wonderful("wonderful")

IO.puts Test.ihatehw("I hate homework")
