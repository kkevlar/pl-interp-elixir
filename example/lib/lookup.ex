defmodule Lookup do
  def lookup(sym, env-list) do
    if length(the_list) == 0 do
      raise "lookup name not found!"
    else
      if sym == (Binding.name first(env-list)) do
        (Binding.val first(env-list))
      else
        [head | tail] = env-list
        lookup(sym, tail)
      end
    end
  end
end

#Binding [:name, :val]
#<name of struct>.name
