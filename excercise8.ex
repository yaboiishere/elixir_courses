
defmodule Checker do
  def is_int_or_float(a), do: is_integer(a) or is_float(a)

  def is_string(a), do: is_binary(a)
end

defmodule Printer do
  def print(a), do: IO.puts(a)
end

defmodule Arit do
  import Checker
  import Printer
  def sum(a, b) do
    with true <- is_int_or_float(a),
      true <- is_int_or_float(b) do
        print(a+b)
      else
        print("Invalid arguments")
      end
  end

  def sub(a, b) do
    with true <- is_int_or_float(a),
      true <- is_int_or_float(b) do
        print(a-b)
        else
          print("Invalid arguments")
      end
  end
  def mult(a, b) do
    with true <- is_int_or_float(a),
      true <- is_int_or_float(b) do
        print(a*b)
      else
        print("Invalid arguments")
      end
  end
  def div(a, b) do
    with true <- is_int_or_float(a),
      true <- is_int_or_float(b) do
        print(a/b)
      else
        print("Invalid arguments")
      end
  end
  def con(a,b) do
    with true <- is_string(a),
      true <- is_string(b) do
        print(a++b)
      else
        print("Invalid arguments")
      end
  end

end
