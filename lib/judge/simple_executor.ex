require IEx
defmodule Judge.SimpleExecutor do
  def execute(evidence, rule) do
    match_conditions?(rule[:conditions], evidence)
  end

  def match_conditions?(%{ operator: "is_equal_to"} = conditions, evidence) do
    evidence[conditions[:param]] == conditions[:value]
  end

  def match_conditions?(%{ operator: "is_not_equal_to" } = conditions, evidence) do
    evidence[conditions[:param]] != conditions[:value]
  end

  def match_conditions?(%{ operator: "less_than" } = conditions, evidence) do
    evidence[conditions[:param]] < conditions[:value]
  end

  def match_conditions?(%{ operator: "bigger_than" } = conditions, evidence) do
    evidence[conditions[:param]] > conditions[:value]
  end

  def match_conditions?(%{ operator: "bigger_than_or_equal_to" } = conditions, evidence) do
    evidence[conditions[:param]] >= conditions[:value]
  end

  def match_conditions?(%{ operator: "less_than_or_equal_to" } = conditions, evidence) do
    evidence[conditions[:param]] <= conditions[:value]
  end
end
