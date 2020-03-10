defmodule ExprC do
  defmodule NumC do
    defstruct [:num]  
  end
  defmodule StringC do
    defstruct [:str]  
  end
  defmodule IfC do
    defstruct [:test, :then, :else]  
  end
end

