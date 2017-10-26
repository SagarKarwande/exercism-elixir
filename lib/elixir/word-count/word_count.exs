defmodule Words do
  @ascii_punctuation ~r/!|"|\#|\$|%|&|'|\(|\)|\*|\+|,|\.|\/|:|;|<|=|>|\?|@|\[|\\|]|\^|_|`|\{|\||}|~/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(@ascii_punctuation, " ")
    |> String.split()
    |> Enum.reduce(%{}, &count_words/2)
  end

  defp count_words(word, count_map) do
    Map.update(count_map, word, 1, &(&1 + 1))
  end
end
