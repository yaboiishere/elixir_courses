defmodule Ex10.Aq do
  def get_by_country(country \\ "BG") do
    url = "https://api.openaq.org/v1/latest?country=#{country}"
    {:ok, agent_pid} = Agent.start_link(fn -> parse_url(url) end)
    %{"results" => results} = Jason.decode!(Agent.get(agent_pid, & &1))

    {:ok, pid} = Ex10.Minmax.start_link([])

    for res <- results do
      Enum.each(
        res["measurements"],
        fn measurement ->
          cond do
            String.contains?(measurement["parameter"], "o3") ->
              val = measurement["value"]
              %{min: min, max: max, min_res: _min_res, max_res: _max_res} = Ex10.Minmax.get(pid)
              max_measure(res, val, max, pid)
              min_measure(res, val, min, pid)

            true ->
              :nothing
          end
        end
      )
    end

    %{min: min, max: max, min_res: min_res, max_res: max_res} = Ex10.Minmax.get(pid)
    IO.puts("Highest o3 reading is #{max} in\n")
    IO.inspect(max_res)
    IO.puts("Lowest o3 reading is #{min} in\n")
    IO.inspect(min_res)
    :ok
  end

  defp max_measure(res, val, max_val, pid) when val > max_val do
    Ex10.Minmax.set_max(pid, res, val)
  end

  defp max_measure(res, val, max_val, pid) when val == max_val do
    Ex10.Minmax.set_max(pid, [res], val)
  end

  defp max_measure(_res, _val, _max_val, _pid) do
    :do_nothing
  end

  defp min_measure(res, val, min_val, pid) when val < min_val do
    Ex10.Minmax.set_min(pid, res, val)
  end

  defp min_measure(res, val, min_val, pid) when val == min_val do
    Ex10.Minmax.set_min(pid, [res], val)
  end

  defp min_measure(_res, _val, _min_val, _pid) do
    :do_nothing
  end

  defp parse_url(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        404

      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end
end
