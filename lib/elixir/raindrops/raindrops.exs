defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    displayMsg([isPrimeFactor(number,3), isPrimeFactor(number,5), isPrimeFactor(number,7)], number)
  end

  defp isPrimeFactor(n, 3) when rem(n, 3) == 0, do: "Pling"
  defp isPrimeFactor(n, 5) when rem(n, 5) == 0, do: "Plang"
  defp isPrimeFactor(n, 7) when rem(n, 7) == 0, do: "Plong"
  defp isPrimeFactor(_,_), do: ""

  def displayMsg(["","",""], n), do: "#{n}"
  def displayMsg(output,_), do: Enum.join output
end
