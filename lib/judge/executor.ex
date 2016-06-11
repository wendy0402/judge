defmodule Judge.Executor do
  def execute(evidence, %{conditions: conditions} = rule) do
    Enum.all?(rule[:conditions], fn(condition) -> evaluate_condition(evidence, condition) end)
  end

  defp evaluate_condition(evidence, condition) do
    module = Module.concat(Judge, "#{String.capitalize(condition[:type])}Executor")
    module.execute(evidence, condition)
  end
end
