defmodule ExprC do
  defmodule NumC do
    @enforce_keys [:num]
    defstruct [:num]
  end
  defmodule StringC do
    @enforce_keys [:str]
    defstruct [:str]
  end
  defmodule IfC do
    @enforce_keys [:test, :then, :else]
    defstruct [:test, :then, :else]  
  end
  defmodule IdentifierC do
    @enforce_keys [:id]
    defstruct [:id]
  end
  defmodule AppC do
    @enforce_keys [:fun, :eargs]
    defstruct [:fun, :eargs]
  end
  defmodule LambdaC do
    @enforce_keys [:sargs, :body]
    defstruct [:sargs, :body]
  end
  defmodule PrimV do
    @enforce_keys [:name, :code]
    defstruct [:name, :code]
  end
end
