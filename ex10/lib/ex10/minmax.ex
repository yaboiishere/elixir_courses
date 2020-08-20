defmodule Ex10.Minmax do
  use GenServer

  @impl true
  def init(:ok) do
    state = %{min: 100, max: 0, min_res: [], max_res: []}
    {:ok, state}
  end

  @impl true
  def handle_call(
        {:set_max, res, _val},
        _from,
        state = %{min: _min, max: _max, min_res: _min_res, max_res: max_res}
      )
      when is_list(res) do
    state = Map.put(state, max_res, res ++ max_res)
    {:reply, :ok, state}
  end

  @impl true
  def handle_call({:set_max, res, val}, _from, state) do
    state = Map.put(state, :max, val)
    state = Map.put(state, :max_res, res)
    {:reply, :ok, state}
  end

  @impl true
  def handle_call(
        {:set_min, res, _val},
        _from,
        state = %{min: _min, max: _max, min_res: min_res, max_res: _max_res}
      )
      when is_list(res) do
    state = Map.put(state, min_res, res ++ min_res)
    {:reply, :ok, state}
  end

  @impl true
  def handle_call({:set_min, res, val}, _from, state) do
    state = Map.put(state, :min, val)
    state = Map.put(state, :min_res, res)
    {:reply, :ok, state}
  end

  @impl true
  def handle_call(
        {:get_max},
        _from,
        state = %{min: _min, max: max, min_res: _min_res, max_res: max_res}
      ) do
    {:reply, %{max: max, max_res: max_res}, state}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  # Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def set_max(pid, res, val) do
    GenServer.call(pid, {:set_max, res, val})
  end

  def set_min(pid, res, val) do
    GenServer.call(pid, {:set_min, res, val})
  end

  def get(pid) do
    GenServer.call(pid, {:get})
  end
end
