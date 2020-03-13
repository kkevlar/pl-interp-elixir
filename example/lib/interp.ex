defmodule Interp do
  #NumC
  def interp(%{num: n}, _env) do
    %Value.NumV{num: n}
  end
  #StringC
  def interp(%{str: s}, _env) do
    %Value.StringV{str: s}
  end
  #IdC
  def interp(%{id: id}, env) do
    Lookup.lookup(id, env)
  end

  #IfC
  def interp(%{test: test, then: then, else: els}, env) do
    if Interp.interp(test, env) == %Value.BoolV{bool: true} do
      Interp.interp(then, env)
    else
      Interp.interp(els, env)
    end
  end

  #LamC
  def interp(%{sargs: sym_list, body: expr}, env) do
    %Value.ClosV{arg_list: sym_list, expr: expr, env: env}
  end

  #AppC
  def interp(%{fun: fun, eargs: eargs}, env) do
    vfun = Interp.interp(fun, env)
    vargs = for arg <- eargs, do: (fn (arg) -> Interp.interp(arg, env) end).(arg)
    case vfun do
      %Value.ClosV{arg_list: sargs, expr: expr, env: clo_env} ->
        ext = Extend_env.extend_env(sargs, vargs, clo_env) 
        Interp.interp(expr, ext)
      %Value.PrimV{code: code}->
        case vargs do
          [%Value.NumV{num: numl},%Value.NumV{num: numr}] ->
            %Value.NumV{num: code.(numl , numr)}
          _ ->
            raise "Prims take only two arguments both nums"
        end
      _ ->
        raise "An application must take a closure or prim"
    end
  end

end
