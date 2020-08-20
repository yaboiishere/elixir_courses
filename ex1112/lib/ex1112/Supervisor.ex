defmodule Ex1112.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {Ex1112.Store, name: Ex1112.Store},
      {Ex1112.Comm1, name: Ex1112.Comm1},
      {Ex1112.Comm2, name: Ex1112.Comm2}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
