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
    @enforce_keys [:arg_list, :expr, :env]
    defstruct [:arg_list, :expr, :env]
  end
  defmodule PrimV do
    @enforce_keys [:code]
    defstruct [:code]
  end
end
