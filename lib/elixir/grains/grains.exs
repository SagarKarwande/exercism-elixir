defmodule Grains do
  use Bitwise
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when(number > 64 or number < 1), do: { :error, "The requested square must be between 1 and 64 (inclusive)" }
  def square(number), do: {:ok, 1 <<< number-1 }

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    total = 1..64 |> Enum.reduce(0, fn(x, acc) -> { :ok, sq} = square(x); sq + acc end)
    {:ok, total}
  end
end
