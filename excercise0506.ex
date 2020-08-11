defmodule Math do

  #Implement functions, that solve a quadratic equation using the conditional operators and with.
  #The coeficients are passed as a tuple, and each conditional operator should
  # be implemented in a seperate function.
  def solve_quad({a,b,c}) do
    cond do
      a == 0 -> #solve_lineino
        "x = #{-b}"
      a != 0 ->
        case get_disc({a,b,c}) do #get disc
          {:ok, solution} -> "x1 = x2 = #{solution}"
          {:quad, {x1, x2}} -> "x1 = #{x1}, x2 = #{x2}"
          {:error, err} -> err
        end

    end
  end
  def get_disc({a,b,c}) do
    disc = b*b-4*a*c
    cond do
      disc == 0 ->
        {:ok, -b/2*a}
      disc > 0 ->
        {:quad, {(-b + :math.sqrt(disc))/ 2*a, (-b - :math.sqrt(disc))/ 2*a }}
      disc < 0 ->
        {:error, "No real solution"}
    end

  end
end

defmodule Ex do

  #Implement a function, that given a list, an integer, and a value,
  # returns the item, that is at the integer’s position in the list, and if the list has less elements than the second argument, return the value
  def ex2(list, char) when is_list(list) do
    Enum.map(list, fn(el)->
      "#{el}#{char}"
    end)
  end

  #Implement a function, that given a list, an integer, and a value,
  #returns the item, that is at the integer’s position in the list, and if the list has less elements than the second argument, return the value
  # ex3([1,2,3], 2, 100)
  # 3

  # ex3([1,2,3], 4, 100)
  # 100

  def ex3(list, int, val) when is_list(list) do
    case Enum.at(list, int) do
      nil -> val
      x -> x
      _ -> "Something went wrong"

    end
  end
  #Implement a function, that given a list and an integer (n), returns the first n elements
  # from the list. If the length of the list is less than n, return the whole list
  # ex4([1,2,3], 2)
  #  [1,2]
  # ex4([1,2,3], 540)
  #  [1,2,3]

  def ex4(list, i) when is_list(list) and i>0 do
    cond do
      Enum.count(list) < i  -> list
      true -> Enum.take(list, i)

    end
  end
  # Write a comprehension, that given a list of strings, uppercases all of them Write
  # a comprehension, that given a list of strings, returns a list of the uppercased version
  # of the ones that are under 5 characters You have a list of titles, and list of names
  #  titles = ["Mr. ", "Mrs. "] names = ["Ivan Georgiev", "Nikola Nikolov", "Antoaneta Velieva"]
  # Write a comprehension that combines each title with each name

  #Build upon the previous comprehension, giving the “Mrs ” title if the last name ends on “a”,
  # otherwise use the other one

  def ex5_upper_all(names \\ ["Ivan Georgiev", "Nikola Nikolov", "Antoaneta Velieva"]) do
    for name <- names do
      String.upcase(name)
    end
  end

  def ex5_upper(names \\ ["Ivan Georgiev", "Nikola Nikolov", "Antoaneta Velieva"]) do
    for name <- names do
      [first, last] = String.split(name)
      cond do
        String.length(first) < 6 -> String.upcase(first <> " " <> last)
        true -> first <> " " <> last
      end
    end
  end

  def ex5_title( titles \\ ["Mr. ", "Mrs. "], names \\ ["Ivan Georgiev", "Nikola Nikolov", "Antoaneta Velieva"]) do
    for name <- names do
      [name] = ex5_upper([name])
      cond do
        String.downcase(String.last(name)) == "a" -> Enum.at(titles, 1) <> name
        true -> Enum.at(titles, 0) <> name
      end

    end
  end

  #Write a function which checks the number of elements in a
  #tuple, if ther are more than 4 it should return "Shouldn't you use a list."
  def ex6(tuple) when is_tuple(tuple) do
    case Enum.count(tuple) do
      x when x<5 -> x
      x -> "Shouldn't you use a list"
      _ -> "Unknown error occurred"
    end
  end

  #Write a function that takes a list of numbers and calculates the product of all of them.
  def ex7(list) when is_list(list) do
    Enum.reduce(list, fn(x, acc) ->
      acc + x
    end)
  end

  #Write a function takes a lsit of numbers and returns
  #a new list containing only the even numbers.
  def ex8(list) when is_list(list) do
    Enum.filter(list, fn(el) ->
      rem(el, 2) == 0
    end)
  end

  #Write a function that takes a list of strings and concatenates all of them.
  def ex9(list) when is_list(list) do
    Enum.reduce(list, fn(el, acc)->
      acc <> el
    end)
  end
end
