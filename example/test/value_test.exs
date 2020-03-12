defmodule ValueTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "make NumV 8" do
    eight = %Value.NumV{num: 8}
    oof = eight.num
    assert oof == 8
  end
  test "make BoolV true" do
    trueth = %Value.BoolV{bool: true}
    wry = trueth.bool
    assert wry == true
  end
  test "make StringV a" do
    lmao = %Value.StringV{str: "lmao"}
    oof = lmao.str
    assert oof == "lmao"
  end
  test "make ClosV (a,b) (AppC + a b)" do
    #AppC => defstruct [:fun, :eargs]
    one_plus_two = %ExprC.AppC{fun: %ExprC.IdentifierC{id: :+}, eargs: [%ExprC.NumC{num: 1}, %ExprC.NumC{num: 2}]}
    binding = %Bindings.Binding{name: :a, val: %Value.NumV{num: 1}}
    close = %Value.ClosV{arg_list: [:a], expr: one_plus_two, env: [binding]}
    args = close.arg_list
    assert args == [:a]
    exp = close.expr
    assert exp == one_plus_two
  end
  test "make PriOpV +" do
    lmao = %Value.PrimV{code: &(&1 + &2)}
    oof = lmao.code
    assert oof == &(&1 + &2) 
  end

end
