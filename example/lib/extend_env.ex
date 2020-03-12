defmodule Extend_env do
  def extend_env(sym_list, val_list, env) do
    if length(sym_list) != length(val_list) do
      raise "Sym_list and Val_list must share same length to extend env"
    else
      if length(sym_list) <= 0 do
        env
      else
        [sym_head | sym_tail] = sym_list
        [val_head | val_tail] = val_list
        [%Bindings.Binding{name: sym_head, val: val_head}
          | extend_env(sym_tail, val_tail, env)]
      end
    end
  end
end
