defmodule SimpleExecutorTest do
  use ExUnit.Case

  import Judge.SimpleExecutor

  # equal
  test "is_equal_to with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "is_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  test "is_equal_to with evidence value != expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "is_equal_to", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 2000, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  # is_not_equal_to
  test "is_not_equal_to with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "is_not_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  test "is_not_equal_to with evidence value != expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "is_not_equal_to", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 2000, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  ### less_than
  test "less_than with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  test "less_than with evidence value < expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  test "less_than with evidence value > expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  ## bigger_than
  test "bigger_than with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  test "bigger_than with evidence value < expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  test "bigger_than with evidence value > expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  ### less_than
  test "less_than_or_equal_to with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  test "less_than_or_equal_to with evidence value < expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  test "less_than_or_equal_to with evidence value > expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  ## bigger_than_or_equal_to
  test "bigger_than_or_equal_to with evidence value == expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end

  test "bigger_than_or_equal_to with evidence value < expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount},
      decisions: %{ name: "judge", age: 20 }
    }

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == nil
  end

  test "bigger_than_or_equal_to with evidence value > expected_value from conditions" do
    rule = %{
      conditions: %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount},
      decisions: %{name: 'judge', age: 20}
    }

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == rule[:decisions]
  end
end
