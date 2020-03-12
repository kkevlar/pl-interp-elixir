defmodule EnvTest do
  use ExUnit.Case

  test "sanity" do
    assert 1 == 1
  end
  test "make binding" do
    bind = %Bindings.Binding{name: :true, val: true}
    assert bind.name == :true
    assert bind.val == true
  end
  test "lmao" do
    [_head | [_h2 | [oof | _unused]]] = Bindings.makeTopEnv()
    assert oof.val.code.(1,2) == 3
  end
end
