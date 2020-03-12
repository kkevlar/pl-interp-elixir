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
    good_symbol_1 = :a
    good_symbol_2 = :b
    blank_symbol = :c
    binding0 = %Bindings.Binding{name: good_symbol_1, val: %Value.PriOpV{sym: :+}}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: %Value.PriOpV{sym: :-}}
    assert_raise RuntimeError, fn -> Lookup.lookup(blank_symbol, [binding0, binding1]) end
  end

  test "return value a" do
    good_symbol_1 = :a
    good_symbol_2 = :b
    blank_symbol = :c
    binding0 = %Bindings.Binding{name: good_symbol_1, val: %Value.PriOpV{sym: :+}}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: %Value.PriOpV{sym: :-}}
    binding2 = %Bindings.Binding{name: blank_symbol, val: %Value.PriOpV{sym: :*}}
    assert Lookup.lookup(good_symbol_1, [binding0, binding1, binding2]) == %Value.PriOpV{sym: :+}
  end

  test "return value *" do
    plus_symbol = :+
    minus_symbol = :-
    mult_symbol = :*
    div_symbol = :/
    binding1 = %Bindings.Binding{name: plus_symbol, val: %Value.PriOpV{sym: :+}}
    binding2 = %Bindings.Binding{name: minus_symbol, val: %Value.PriOpV{sym: :-}}
    binding3 = %Bindings.Binding{name: mult_symbol, val: %Value.PriOpV{sym: :*}}
    binding4 = %Bindings.Binding{name: div_symbol, val: %Value.PriOpV{sym: :/}}
    assert Lookup.lookup(mult_symbol, [binding1, binding2, binding3, binding4]) == %Value.PriOpV{sym: :*}
  end

end
