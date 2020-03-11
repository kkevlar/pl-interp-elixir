defmodule Interp do
  def interp(%{num: n}) do
    n
  end
  def interp(%{str: s}) do
    s
  end
end

