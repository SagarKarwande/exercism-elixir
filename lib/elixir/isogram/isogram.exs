defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    normalizedStr = String.replace(sentence, ~r/[ -]/, "")
    map = normalizedStr
          |> String.to_charlist
          |> MapSet.new
    String.length(normalizedStr) == MapSet.size(map)
  end
end
