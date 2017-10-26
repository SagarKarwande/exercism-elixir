defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_elements(list, fun, [])
  end

  defp keep_elements([], _, result), do: Enum.reverse(result)
  defp keep_elements([h | t], func, result) do
    case apply(func, [h]) do
      true -> keep_elements(t, func, [h | result])
      _    -> keep_elements(t, func, result)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    discard_elements(list, fun, [])
  end

  defp discard_elements([], _, result), do: Enum.reverse(result)
  defp discard_elements([h | t], func, result) do
    case apply(func, [h]) do
      false -> discard_elements(t, func, [h | result])
      _     -> discard_elements(t, func, result)
    end
  end
end
