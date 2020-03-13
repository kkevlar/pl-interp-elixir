defmodule Extend_env do
  def extend_env(sym_list, val_list, env) do
    if length(sym_list) != length(val_list) do
      raise DUNQ
    end
    Extend_env.extend_env_rec(sym_list, val_list, env)
  end

  def extend_env_rec([], [], env) do
      env
  end
  def extend_env_rec([sym_head | sym_tail], [val_head | val_tail], env) do
        [%Bindings.Binding{name: sym_head, val: val_head}
          | extend_env_rec(sym_tail, val_tail, env)]
  end
end
