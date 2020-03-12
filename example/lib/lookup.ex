defmodule Lookup do
  def lookup(sym, env_list) do
    if length(env_list) <= 0 do
      raise "lookup name not found!"
    else
      [head | tail] = env_list
      if sym == (head.name) do
        (head.val)
      else
        lookup(sym, tail)
      end
    end
  end
end

#Binding [:name, :val]
#<name of struct>.name
