defmodule Ex1112.Store do
  use GenServer

  @impl true
  def init(:ok) do
    map = %{}
    messages = []
    {:ok, {messages, map}}
  end

  @impl true
  def handle_call({:lookup, key}, _from, {messages, map}) do
    {:reply, Map.get(map, key), {messages, map}}
  end

  @impl true
  def handle_call({:create, key, el}, _from, {messages, map}) do
    if Map.has_key?(map, key) do
      {:reply, :already_exists, {messages, map}}
    else
      {:reply, :ok, {messages, Map.put(map, key, el)}}
    end
  end

  @impl true
  def handle_call({:delete, key}, _from, {messages, map}) do
    if Map.has_key?(map, key) do
      {:reply, :ok, Map.pop!(map, key)}
    else
      {:reply, {messages, map}}
    end
  end

  @impl true
  def handle_call({:last_message}, _from, {[head | tail], map}) do
    {:reply, head, {tail, map}}
  end

  @impl true
  def handle_call({:messages}, _from, {messages, map}) do
    {:reply, messages, {messages, map}}
  end

  @impl true
  def handle_cast({:new_message, {:new_message, msg}}, {messages, map}) do
    {:noreply, {[msg] ++ messages, map}}
  end

  @impl true
  def handle_cast({:new_message, msg}, {messages, map}) do
    {:noreply, {[msg] ++ messages, map}}
  end

  @impl true
  def handle_cast({:delete_message}, {[_head | tail], map}) do
    {:noreply, {tail, map}}
  end

  @impl true
  def terminate(reason, _state) do
    IO.puts("server terminated because of #{inspect(reason)}")
    :ok
  end

  # Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def lookup(pid, key) do
    GenServer.call(pid, {:lookup, key})
  end

  def create(pid, key, el) do
    GenServer.call(pid, {:create, key, el})
  end

  def delete(pid, key) do
    GenServer.call(pid, {:delete, key})
  end

  def last_message(pid) do
    GenServer.call(pid, {:last_message})
  end

  def new_message(pid, msg) do
    GenServer.cast(pid, {:new_message, msg})
  end

  def delete_message(pid) do
    GenServer.cast(pid, {:delete_message})
  end

  def messages(pid) do
    GenServer.call(pid, {:messages})
  end
end
