defmodule Ex1112 do
  @moduledoc """
  Documentation for `Ex1112`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Ex1112.hello()
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    # Although we don't use the supervisor name below directly,
    # it can be useful when debugging or introspecting the system.
    Ex1112.Supervisor.start_link(name: Ex1112.Supervisor)
  end
end
