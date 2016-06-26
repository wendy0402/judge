# Judge

Judge is simple rule engine application in favor for me to learn elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add judge to your list of dependencies in `mix.exs`:

        def deps do
          [{:judge, "~> 0.0.1"}]
        end

  2. Ensure judge is started before your application:

        def application do
          [applications: [:judge]]
        end
## Usage

The Idea of Judge is group rules into a bucket, and then after that you can choose which bucket to use for evaluation.

To create a bucket do:
```elixir
Judge.Buckets.create(:random_buckets)
```

Then to put a rule at first you need to fetch the bucket:
```elixir
bucket = Judge.Buckets.lookup(:random_buckets) # if not present it will return :error
```

after that you can add a rule in that bucket:
```elixir
rule = [
  decisions: %{name: "judge", age: 22}, # mandatory
  conditions: [
    %{type: "simple", operator: "is_equal_to", value: "20", param: "amount" }
] #mandatory

bucket = Judge.Buckets.lookup(:random_buckets)
Judge.Knowledge.add(bucket, rule)
```

as you can see, the mandatory parameters are decisions and conditions. you can put any random value in decisions.
Meanwhile for conditions it has to be a list of condition.

For now judge only support a really simple conditions with mandatory attributes: `type`, `operator`, `value`, `param`.

| Attribute 	| Data Type 	| Mandatory 	| Detail                                                                 	|
|-----------	|-----------	|-----------	|------------------------------------------------------------------------	|
| type      	| string    	| yes       	| type of conditions(for now only support `simple`)                      	|
| operator  	| string    	| yes       	| definitions on how to compare                                          	|
| value     	| any       	| yes       	| expected value                                                         	|
| param     	| string    	| yes       	| base parameter which its value will be compared with `value` attribute 	|

list of allowed operator:
`is_equal_to`, `is_not_equal_to`, `less_than`, `bigger_than`, `bigger_than_or_equal_to`, `less_than_or_equal_to`

# Evaluation

to evaluate find bucket that you'll be used then just evaluate it:
```elixir
bucket = Judge.Buckets.lookup(:random_buckets)
Judge.Knowledge.evaluate(bucket, %{ amount: 22 }) # %{}
Judge.Knowledge.evaluate(bucket, %{ amount: 20 }) # %{name: judge, age: 20}
```
