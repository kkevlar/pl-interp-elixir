defmodule Bindings do

  defmodule Binding do
    @enforce_keys [:name, :val]
    defstruct [:name, :val]
  end

end
