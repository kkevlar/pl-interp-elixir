defmodule Interp do
  def interp(%{num: n}, _env) do
    n
  end
  def interp(%{str: s}, _env) do
    s
  end
  def interp(%{id: id}, _env) do
    cond do
      id == :true -> true
      id == :false -> false
    end
  end
  def interp(%{test: test, then: then, else: els}, env) do
    if Interp.interp(test, env) do
      Interp.interp(then, env)
    else
      Interp.interp(els, env)
    end
  end
end

