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
  def interp(%{id: id}, env) do
    Lookup.lookup(id, env)
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
  def interp(%{symbols: sym_list, exp: expr}, env) do
    %Value.ClosV{arg_list: sym_list, expr: expr, env: env}
  end

  #AppC
end
