defmodule StructmeTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "interp a number" do
    eight = %ExprC.NumC{num: 8}
    assert Interp.interp(eight, []) == %Value.NumV{num: 8} 
  end
  test "interp a string" do
    expr = %ExprC.StringC{str: "hello"}
    assert Interp.interp(expr, []) == %Value.StringV{str: "hello"}
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
    assert Interp.interp(expr,[true_binding, false_binding]) == %Value.NumV{num: 42}
  end
  test "interp an if false" do
    etest = %ExprC.IdentifierC{id: :falsa}
    ethen = %ExprC.NumC{num: 42}
    eelse = %ExprC.NumC{num: 43}
    true_binding = %Bindings.Binding{name: :trueth, val: %Value.BoolV{bool: true}}
    false_binding = %Bindings.Binding{name: :falsa, val: %Value.BoolV{bool: false}}

    expr = %ExprC.IfC{test: etest, then: ethen, else: eelse}
    assert Interp.interp(expr, [true_binding, false_binding]) == %Value.NumV{num: 43} 
  end
  test "interp a lambda" do
    mylambda = %ExprC.LambdaC{sargs: [:x,:y], body: %ExprC.AppC{fun: %ExprC.IdentifierC{id: :+}, eargs: [%ExprC.IdentifierC{id: :x}, %ExprC.IdentifierC{id: :y}]}}
    %{arg_list: a, expr: e, env: v} = Interp.interp(mylambda, [])
    [_x | [y | _empty]] = a
    %ExprC.AppC{fun: fun, eargs: _unused} = e 
    %ExprC.IdentifierC{id: plus} = fun
    assert y == :y
    assert plus == :+
    assert v == [] 
  end
  test "interp closure" do
    mylambda = %ExprC.LambdaC{sargs: [:x,:y], body: %ExprC.IdentifierC{id: :x}}
    myapp = %ExprC.AppC{fun: mylambda, eargs: [%ExprC.NumC{num: 60}, %ExprC.NumC{num: 0}]}
    %Value.NumV{num: num} = Interp.interp(myapp, [])
    assert num == 60
  end

  test "interp a non closure or prim" do
    myapp = %ExprC.AppC{fun: %ExprC.StringC{str: "aaa"} , eargs: [%ExprC.NumC{num: 60}, %ExprC.NumC{num: 12}]}
    assert_raise RuntimeError, fn -> Interp.interp(myapp, Bindings.makeTopEnv()) end 
  end

  test "interp closure with prim" do
    mylambda = %ExprC.LambdaC{sargs: [:x,:y],
      body: %ExprC.AppC{fun: %ExprC.IdentifierC{id: :+},
      eargs: [%ExprC.IdentifierC{id: :x}, %ExprC.IdentifierC{id: :y}]}}
    myapp = %ExprC.AppC{
      fun: mylambda, 
      eargs: [%ExprC.NumC{num: 60}, %ExprC.NumC{num: 12}]}
    %Value.NumV{num: result} = Interp.interp(myapp, Bindings.makeTopEnv()) 
    assert result == 72
  end

  test "interp closure with prim wrong args" do
    mylambda = %ExprC.LambdaC{sargs: [:x,:y],
      body: %ExprC.AppC{fun: %ExprC.IdentifierC{id: :+},
      eargs: [%ExprC.IdentifierC{id: :x}, %ExprC.IdentifierC{id: :y}]}}
    myapp = %ExprC.AppC{
      fun: mylambda, 
      eargs: [%ExprC.NumC{num: 60}, %ExprC.NumC{num: 12}, %ExprC.NumC{num: 12}]}
    assert_raise RuntimeError, fn -> Interp.interp(myapp, Bindings.makeTopEnv()) end 
  end







end
