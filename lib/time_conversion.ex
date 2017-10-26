defmodule TimeConversion do
  def main(input) do
    input
    |> converter
  end

  def converter(input) do
    [hours, minutes, seconds] = String.split(input, ":")
    period                    = String.slice(seconds, 2..3)
    seconds                   = String.slice(seconds, 0..1)
    formatted_hour            = format_hour(period, hours)
    "#{formatted_hour}:#{minutes}:#{seconds}"
  end

  defp format_hour("AM", "12"), do: "00"
  defp format_hour("AM", hours), do: hours
  defp format_hour("PM", "12"), do: "12"
  defp format_hour("PM", hours), do: "#{String.to_integer(hours) + 12}"
end
