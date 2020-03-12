defmodule Lookup do
  def lookup(_name, []) do
    raise "lookup name not found!"
  end
  def lookup(name, [head | tail]) do
    if name == (head.name) do
      (head.val)
    else
      lookup(name, tail)
    end
  end
end

#Binding [:name, :val]
#<name of struct>.name
