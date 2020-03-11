defmodule StructmeTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "interp a number" do
    eight = %ExprC.NumC{num: 8}
    assert Interp.interp(eight) == 8
  end
  test "interp a string" do
    expr = %ExprC.StringC{str: "hello"}
    assert Interp.interp(expr) == "hello" 
  end
end

