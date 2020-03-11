defmodule Interp do
  def interp(%{num: n}) do
    n
  end
  def interp(%{str: s}) do
    s
  end
  def interp(%{id: id}) do
    cond do
      id == :true -> true
      id == :false -> false
    end
  end
  def interp(%{test: test, then: then, else: els}) do
    if Interp.interp(test) do
      Interp.interp(then)
    else
      Interp.interp(els)
    end
  end
end

