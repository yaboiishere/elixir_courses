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
  def ex2(list, char) when is_list(list) do
    Enum.map(list, fn(el)->
      "#{el}#{char}"
    end)
  end
  def ex3(list, int, value) when Enum.count(list)<value, do: value

  

end
