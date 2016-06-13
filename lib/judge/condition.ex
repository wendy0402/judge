defmodule Judge.Condition do
  @callback execute(%{}, %{}) :: boolean()
  @callback match_condition?(%{}, %{}) :: boolean()
end
