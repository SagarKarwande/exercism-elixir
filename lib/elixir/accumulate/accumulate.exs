defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    map(list, fun)
  end

  def map(list, func), do: map(list, func, [])
  defp map([],_,result), do: result |> reverse
  defp map([h | tail], func, result), do: map(tail, func, [func.(h) | result])

  def reverse(list), do: reverse(list, [])
  defp reverse([h | tail],result), do: reverse(tail, [h | result])
  defp reverse([],result), do: result
end
