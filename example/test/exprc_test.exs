defmodule ExprCTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "makenum" do
    eight = %ExprC.NumC{num: 8}
    oof = eight.num
    assert oof == 8
  end
  test "makestr" do
    lmao = %ExprC.StringC{str: "lmao"}
    oof = lmao.str
    assert oof == "lmao"
  end
  test "makeif" do
    if = %ExprC.IfC{test: false, then: 20, else: "yay"}
    test = if.test
    then = if.then
    els = if.else
    assert test == false
    assert els == "yay"
    assert then == 20
  end
  test "makeif with ast" do
    eight = %ExprC.NumC{num: 8}
    if = %ExprC.IfC{test: false, then: eight, else: eight}
    test = if.test
    then = if.then
    els = if.else
    assert test == false
    assert els.num == 8
    assert then.num == 8
  end
  test "identifier make" do
    theid = %ExprC.IdentifierC{id: :lmao}
    assert theid.id == :lmao
  end
  test "identifier make +" do
    theid = %ExprC.IdentifierC{id: :+}
    assert theid.id == :+
  end
end
