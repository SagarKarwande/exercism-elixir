defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    triangle_type(a, b, c)
  end

  def triangle_type(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  def triangle_type(a, b, c) when a + b <= c, do: { :error, "side lengths violate triangle inequality" }
  def triangle_type(a, b, c) when a + c <= b, do: { :error, "side lengths violate triangle inequality" }
  def triangle_type(a, b, c) when b + c <= a, do: { :error, "side lengths violate triangle inequality" }

  def triangle_type(a, a, a), do: { :ok, :equilateral }

  def triangle_type(a, _, a), do: { :ok, :isosceles }
  def triangle_type(a, a, _), do: { :ok, :isosceles }
  def triangle_type(_, a, a), do: { :ok, :isosceles }

  def triangle_type(a, b, c), do: { :ok, :scalene }
end
