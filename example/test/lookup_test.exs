defmodule LookUpTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end

  test "Error for empty env" do
    bad_symbol = :a
    assert_raise DUNQ, fn -> Lookup.lookup(bad_symbol, []) end
  end

  test "Raise Error for symbol not found" do
    good_symbol_1 = :a
    good_symbol_2 = :b
    blank_symbol = :c
    binding0 = %Bindings.Binding{name: good_symbol_1, val: %Value.PrimV{code: &(&1 + &2)}}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: %Value.PrimV{code: &(&1 - &2)}}
    assert_raise DUNQ, fn -> Lookup.lookup(blank_symbol, [binding0, binding1]) end
  end

  test "return value a" do
    good_symbol_1 = :a
    good_symbol_2 = :b
    blank_symbol = :c
    binding0 = %Bindings.Binding{name: good_symbol_1, val: %Value.PrimV{code: &(&1 + &2)}}
    binding1 = %Bindings.Binding{name: good_symbol_2, val: %Value.PrimV{code: &(&1 - &2)}}
    binding2 = %Bindings.Binding{name: blank_symbol, val: %Value.PrimV{code: &(&1 * &2)}}
    assert Lookup.lookup(good_symbol_1, [binding0, binding1, binding2]) == %Value.PrimV{code: &(&1 + &2)}
  end

  test "return value *" do
    plus_symbol = &(&1 + &2)
    minus_symbol = &(&1 - &2)
    mult_symbol = &(&1 * &2)
    div_symbol = &(&1 / &2)
    binding1 = %Bindings.Binding{name: plus_symbol, val: %Value.PrimV{code: &(&1 + &2)}}
    binding2 = %Bindings.Binding{name: minus_symbol, val: %Value.PrimV{code: &(&1 - &2)}}
    binding3 = %Bindings.Binding{name: mult_symbol, val: %Value.PrimV{code: &(&1 * &2)}}
    binding4 = %Bindings.Binding{name: div_symbol, val: %Value.PrimV{code: &(&1 / &2)}}
    assert Lookup.lookup(mult_symbol, [binding1, binding2, binding3, binding4]) == %Value.PrimV{code: &(&1 * &2)}
  end

end
