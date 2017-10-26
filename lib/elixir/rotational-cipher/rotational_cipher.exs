defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for <<c::8 <- text>> do
      cond do
        (c >= ?A) && (c <= ?Z) -> (rem c - ?A + shift, 26) + ?A
        (c >= ?a) && (c <= ?z) -> (rem c - ?a + shift, 26) + ?a
        true -> c
      end
    end |> to_string
  end

end
