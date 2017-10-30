defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flatten_list(list, [])
  def flatten_list([head | tail], acc) when is_list(head), do: flatten_list(head, flatten_list(tail, acc))
  def flatten_list([nil| tail], acc), do: flatten_list(tail, acc)
  def flatten_list([head |tail], acc), do: [head | flatten_list(tail, acc)]
  def flatten_list([], acc), do: acc
end
