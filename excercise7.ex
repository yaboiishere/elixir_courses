defmodule Rec do

  def con_list(list), do: con_list(list, "")
  defp con_list([head | tail], acc), do: con_list(tail, acc <> inspect(head))
  defp con_list([], acc), do: acc

  def sum_list(list), do: sum_list(list, 0)
  defp sum_list([head | tail], acc), do: sum_list(tail, acc+head)
  defp sum_list([], acc), do: acc

  def fact(f), do: fact(1,f,1)
  defp fact(n, f, acc)  when n>f, do: acc
  defp fact(n, f, acc), do: fact(n+1, f ,acc*n)


end
