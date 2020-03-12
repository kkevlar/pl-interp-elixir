defmodule Listy do
  def addup([]), do: 0
  def addup([num | tail]), do: num + addup(tail)
  def addup(_), do: raise DUNQ
end
