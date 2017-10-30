defmodule Binary do
  use Bitwise
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    case !String.match?(string, ~r{[^10]}) do
      true  -> string
              |> String.reverse
              |> String.to_charlist
              |> Enum.with_index
              |> Enum.reduce(0, fn(bit, acc) -> acc + convert(bit) end)
      _    -> 0
    end
  end

  def convert({?0, weighted_idx}), do: 0
  def convert({?1, weighted_idx}), do: 1 <<< weighted_idx
end
