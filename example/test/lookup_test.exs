defmodule LookUpTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end

  test "Error for empty env" do
    bad_symbol = :a
    assert_raise RuntimeError, fn -> Lookup.lookup(bad_symbol, []) end
  end

  test "Raise Error for symbol not found" do
    good_symbol_1 = "a"
    good_symbol_2 = "b"
    blank_symbol = "c"
    binding0 = %Bindings.Binding{name: good_symbol_1, val: "PriOpV +"}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: "PriOpV -"}
    assert_raise RuntimeError, fn -> Lookup.lookup(blank_symbol, [binding0, binding1]) end
  end

  test "return value a" do
    good_symbol_1 = "a"
    good_symbol_2 = "b"
    blank_symbol = "c"
    binding0 = %Bindings.Binding{name: good_symbol_1, val: "PriOpV +"}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: "PriOpV -"}
    binding2 = %Bindings.Binding{name: blank_symbol, val: "PriOpV *"}
    assert Lookup.lookup(good_symbol_1, [binding0, binding1, binding2]) == "PriOpV +"
  end

end
