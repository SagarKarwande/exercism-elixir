defmodule SecretHandshake do
  use Bitwise

  @actions ["wink", "double blink", "close your eyes", "jump"]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @actions
    |> Enum.with_index
    |> Enum.map(fn {command, i} -> {command, (1 <<< i)} end)
    |> generate_commands(code,[])
  end

  defp generate_commands([], code, result) do
    case is_flag_set(code, 16) do
      true -> result
      _    -> Enum.reverse(result)
    end
  end

  defp generate_commands([{command, flag} | flags], code, result) do
    case is_flag_set(code, flag) do
      true -> generate_commands(flags, code, [command | result])
      _    -> generate_commands(flags, code, result)
    end
  end

  defp is_flag_set(flags, flag_to_check) do
    (flags &&& flag_to_check) == flag_to_check
  end
end
