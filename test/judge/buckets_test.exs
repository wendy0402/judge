defmodule BucketsTest do
  use ExUnit.Case

  test "create new buckets" do
    assert { :ok } = Judge.Buckets.create(:test)
  end

  test "create an existing bucket" do
    Judge.Buckets.create(:test)
    assert { :ok } = Judge.Buckets.create(:test)
  end

  test "lookup non existing bucket" do
    assert :error = Judge.Buckets.lookup(:testnot_found)
  end

  test "lookup existing bucket" do
    Judge.Buckets.create(:test)
    assert knowledge = Judge.Buckets.lookup(:test)
  end
end
