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
  test "interp stupid id true" do
    bool = %ExprC.IdentifierC{id: :true}
    assert Interp.interp(bool, []) == true
  end
  test "interp stupid id false" do
    bool = %ExprC.IdentifierC{id: :false}
    assert Interp.interp(bool, []) == false
  end
  test "interp an if true" do
    etest = %ExprC.IdentifierC{id: :true}
    ethen = %ExprC.NumC{num: 42}
    eelse = %ExprC.IdentifierC{id: :true}

    expr = %ExprC.IfC{test: etest, then: ethen, else: eelse}
    assert Interp.interp(expr,[]) == 42
  end
  test "interp an if false" do
    etest = %ExprC.IdentifierC{id: :false}
    ethen = %ExprC.NumC{num: 42}
    eelse = %ExprC.IdentifierC{id: :true}

    expr = %ExprC.IfC{test: etest, then: ethen, else: eelse}
    assert Interp.interp(expr, []) == true
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


end
