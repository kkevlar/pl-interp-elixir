defmodule Bindings do

  defmodule Binding do
    @enforce_keys [:name, :val]
    defstruct [:name, :val]
  end
  def makeTopEnv do
    [
   %Bindings.Binding{name: :true, val: true}, 
   %Bindings.Binding{name: :false, val: false}, 
   %Bindings.Binding{name: :+, val: %Value.PrimV{code: &(&1 + &2)}} 
    ]
  end

end
