defmodule Ex1112.Comm1 do
  use GenServer

  @impl true
  def init(:ok) do
    messages = []
    {:ok, messages}
  end

  @impl true
  def handle_cast({:send_message, receiver_pid, msg}, messages) do
    GenServer.call(receiver_pid, {:receive_message, msg})
    {:noreply, messages}
  end

  @impl true
  def handle_call({:receive_message, msg}, _from, messages) do
    {:reply, :ok, [msg] ++ messages}
  end

  @impl true
  def handle_call({:messages}, _from, messages) do
    {:reply, messages, messages}
  end

  # Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def send_message(sender_pid, receiver_pid, msg) do
    GenServer.cast(sender_pid, {:send_message, receiver_pid, msg})
  end

  def messages(pid) do
    GenServer.call(pid, {:messages})
  end
end
