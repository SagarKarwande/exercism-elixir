defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end
  defp count([], count), do: count
  defp count([head | tail], count), do: count(tail, count + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, []) |> reverse
  defp map([], _, acc), do: acc
  defp map([head | tail], f, acc), do: map(tail, f, [ f.(head) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, []) |> reverse
  defp filter([], _, acc), do: acc
  defp filter([head | tail], f, acc) do
    case f.(head) do
      true  -> filter(tail, f, [head| acc])
      _     -> filter(tail, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], 0, f), do: 0
  def reduce([], acc, f), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a),b)

  def do_append([], b), do: b
  def do_append([head | tail], b), do: do_append(tail, [head | b])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: reverse(ll) |> reduce([], &(append(&1, &2)))
end
