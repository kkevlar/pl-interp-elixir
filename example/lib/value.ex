defmodule Value do
  defmodule NumV do
    @enforce_keys [:num]
    defstruct [:num]
  end
  defmodule BoolV do
    @enforce_keys [:bool]
    defstruct [:bool]
  end
  defmodule StringV do
    @enforce_keys [:str]
    defstruct [:str]
  end
  defmodule ClosV do
    @enforce_keys [:arg_list, :expr]
    defstruct [:arg_list, :expr]
  end
  defmodule PriOpV do
    @enforce_keys [:sym]
    defstruct [:sym]
  end
end
