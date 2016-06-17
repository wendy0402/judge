defmodule BucketsTest do
  use ExUnit.Case

  test "create new buckets" do
    assert { :ok } = Judge.Buckets.create(Judge.Buckets, :test)
  end

  test "create an existing bucket" do
    Judge.Buckets.create(Judge.Buckets, :test)
    assert { :ok } = Judge.Buckets.create(Judge.Buckets, :test)
  end

  test "lookup non existing bucket" do
    assert :error = Judge.Buckets.lookup(Judge.Buckets, :testnot_found)
  end

  test "lookup existing bucket" do
    Judge.Buckets.create(Judge.Buckets, :test)
    assert knowledge = Judge.Buckets.lookup(Judge.Buckets, :test)
  end
end
