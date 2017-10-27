defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
     dna |> Enum.map(&map(&1))
  end

  defp map(?G), do: ?C
  defp map(?C), do: ?G
  defp map(?A), do: ?U
  defp map(?T), do: ?A
end
