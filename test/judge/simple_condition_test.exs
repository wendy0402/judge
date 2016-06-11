defmodule SimpleConditionTest do
  use ExUnit.Case

  import Judge.SimpleCondition

  # equal
  test "is_equal_to with evidence value == expected_value from conditions" do
    rule = %{ type: "simple", operator: "is_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == true
  end

  test "is_equal_to with evidence value != expected_value from conditions" do
    rule =  %{type: "simple", operator: "is_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 2000, name: "jack" }
    assert execute(evidence, rule) == false
  end

  # is_not_equal_to
  test "is_not_equal_to with evidence value == expected_value from conditions" do
    rule = %{type: "simple", operator: "is_not_equal_to", value: 20, param: :amount}
    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == false
  end

  test "is_not_equal_to with evidence value != expected_value from conditions" do
    rule = %{type: "simple", operator: "is_not_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 2000, name: "jack" }
    assert execute(evidence, rule) == true
  end

  ### less_than
  test "less_than with evidence value == expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than", value: 20, param: :amount}

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == false
  end

  test "less_than with evidence value < expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than", value: 20, param: :amount}

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == true
  end

  test "less_than with evidence value > expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than", value: 20, param: :amount}

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == false
  end

  ## bigger_than
  test "bigger_than with evidence value == expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than", value: 20, param: :amount}

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == false
  end

  test "bigger_than with evidence value < expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than", value: 20, param: :amount}

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == false
  end

  test "bigger_than with evidence value > expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than", value: 20, param: :amount}

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == true
  end

  ### less_than
  test "less_than_or_equal_to with evidence value == expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == true
  end

  test "less_than_or_equal_to with evidence value < expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == true
  end

  test "less_than_or_equal_to with evidence value > expected_value from conditions" do
    rule = %{type: "simple", operator: "less_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == false
  end

  ## bigger_than_or_equal_to
  test "bigger_than_or_equal_to with evidence value == expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 20, name: "jack" }
    assert execute(evidence, rule) == true
  end

  test "bigger_than_or_equal_to with evidence value < expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 5, name: "jack" }
    assert execute(evidence, rule) == false
  end

  test "bigger_than_or_equal_to with evidence value > expected_value from conditions" do
    rule = %{type: "simple", operator: "bigger_than_or_equal_to", value: 20, param: :amount}

    evidence = %{ amount: 200, name: "jack" }
    assert execute(evidence, rule) == true
  end
end
