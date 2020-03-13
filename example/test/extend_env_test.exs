defmodule ExtendEnvTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end

  test "Error for different sym and val list length" do
    value1 = %Value.NumV{num: 1}
    value2 = %Value.NumV{num: 2}
    empty_env = []
    assert_raise DUNQ, fn -> Extend_env.extend_env([:a, :b, :c], [value1, value2], empty_env) end
  end

  test "Extend to empty env" do
    value1 = %Value.NumV{num: 1}
    value2 = %Value.NumV{num: 2}
    bind1 = %Bindings.Binding{name: :a, val: value1}
    bind2 = %Bindings.Binding{name: :b, val: value2}
    empty_env = []
    assert Extend_env.extend_env([:a, :b], [value1, value2], empty_env) == [bind1, bind2]
  end

  test "Extend to non-empty env" do
    value0 = %Value.NumV{num: 0}
    value1 = %Value.NumV{num: 1}
    value2 = %Value.NumV{num: 2}
    bind0 = %Bindings.Binding{name: :z, val: value0}
    bind1 = %Bindings.Binding{name: :a, val: value1}
    bind2 = %Bindings.Binding{name: :b, val: value2}
    env = [bind0]
    assert Extend_env.extend_env([:a, :b], [value1, value2], env) == [bind1, bind2, bind0]
  end

end
