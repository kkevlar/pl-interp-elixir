defmodule StructmeTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "interp a number" do
    eight = %ExprC.NumC{num: 8}
    assert Interp.interp(eight, []) == 8
  end
  test "interp a string" do
    expr = %ExprC.StringC{str: "hello"}
    assert Interp.interp(expr, []) == "hello"
  end

  test "interp an id" do
    symbol_a = %ExprC.IdentifierC{id: :a}
    symbol_b = %ExprC.IdentifierC{id: :b}
    symbol_c = %ExprC.IdentifierC{id: :c}
    binding1 = %Bindings.Binding{name: :a, val: %Value.NumV{num: 1}}
    binding2 = %Bindings.Binding{name: :b, val: %Value.NumV{num: 2}}
    binding3 = %Bindings.Binding{name: :c, val: %Value.NumV{num: 3}}
    assert Interp.interp(symbol_a, [binding1, binding2, binding3]) == %Value.NumV{num: 1}
    assert Interp.interp(symbol_b, [binding1, binding2, binding3]) == %Value.NumV{num: 2}
    assert Interp.interp(symbol_c, [binding1, binding2, binding3]) == %Value.NumV{num: 3}
  end

  test "interp an if true" do
    etest = %ExprC.IdentifierC{id: :trueth}
    ethen = %ExprC.NumC{num: 42}
    eelse = %ExprC.NumC{num: 43}
    true_binding = %Bindings.Binding{name: :trueth, val: %Value.BoolV{bool: true}}
    false_binding = %Bindings.Binding{name: :falsa, val: %Value.BoolV{bool: false}}

    expr = %ExprC.IfC{test: etest, then: ethen, else: eelse}
    assert Interp.interp(expr,[true_binding, false_binding]) == 42
  end
  test "interp an if false" do
    etest = %ExprC.IdentifierC{id: :falsa}
    ethen = %ExprC.NumC{num: 42}
    eelse = %ExprC.NumC{num: 43}
    true_binding = %Bindings.Binding{name: :trueth, val: %Value.BoolV{bool: true}}
    false_binding = %Bindings.Binding{name: :falsa, val: %Value.BoolV{bool: false}}

    expr = %ExprC.IfC{test: etest, then: ethen, else: eelse}
    assert Interp.interp(expr, [true_binding, false_binding]) == 43
  end


end
