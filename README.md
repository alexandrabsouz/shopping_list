# ShoppingList

**TODO: [Stone Test] - Receives a list of items and a list of emails,
  handles and returns the division of values ​​for each email**

## Installation

[Instal Elixir](https://www.erlang-solutions.com/downloads/) 

```bash
~$ elixir -v
Erlang/OTP 24 [erts-12.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Elixir 1.12.2 (compiled with Erlang/OTP 24)
```

#### Elixir Dependencies:

```bash
sudo apt-get install build-essential erlang-dev erlang-xmerl erlang-tools
```

#### Run tests:
```bash
~$ mix test
```

#### Run tests with trace colors:
```bash
~$ mix test --trace --color
```

#### Check all tests using coveralls
```bash
~$ mix coveralls.detail
```


#### Per cent tests coberture using coveralls

```bash

~$ mix coveralls

Randomized with seed 28348
----------------
COV    FILE                                        LINES RELEVANT   MISSED
100.0% lib/shopping_list.ex                           36        5        0
 93.3% lib/shopping_list/calculate.ex                 58       15        1
[TOTAL]  95.0%
----------------
```

#### Run application in interactive mode:
```bash
~$ iex -S mix
```

