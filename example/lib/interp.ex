defmodule Interp do
  #NumC
  def interp(%{num: n}, _env) do
    n
  end
  #StringC
  def interp(%{str: s}, _env) do
    s
  end
  #IdC
  def interp(%{id: id}, _env) do
    cond do
      id == :true -> true
      id == :false -> false
    end
    #Lookup.lookup(id, _env)
  end

  #IfC
  def interp(%{test: test, then: then, else: els}, env) do
    if Interp.interp(test, env) do
      Interp.interp(then, env)
    else
      Interp.interp(els, env)
    end
  end

  #LamC

  #AppC
end
