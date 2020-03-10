defmodule Listy do
  def addup([]), do: 0
  def addup([num | tail]), do: num + addup(tail) 
end

