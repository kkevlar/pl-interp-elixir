defmodule ListyTest do
  use ExUnit.Case

  test "empty list test" do
    assert Listy.addup([]) == 0 
  end
  test "neg pos to zero test" do
    assert Listy.addup([-1, 1]) == 0
  end
  test "2 and 2 test" do
    assert Listy.addup([2, 2]) == 4
  end
  test "one thru 4 test" do
    assert Listy.addup([1, 2, 3, 4]) == 10 
  end
  test "single val test" do
    assert Listy.addup([4]) == 4 
  end
end

