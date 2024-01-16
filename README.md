Elixir 1.16.0: prepending `./` to the test path in command `mix test ./test/some_test.exs:9` breaks
the line filter and **all** tests are excluded.

## Elixir 1.15.7

* `mix test ./test/superproject_test.exs:9` - functional
* `mix test test/superproject_test.exs:9` - functional
* `mix test --exclude test --include line:9 ./test/superproject_test.exs` - functional


```
~/superproject → elixir -v
Erlang/OTP 26 [erts-14.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Elixir 1.15.7 (compiled with Erlang/OTP 26)
~/superproject → cat .tool-versions
elixir 1.15.7-otp-26
erlang 26.2.1
~/superproject → rm -rf _build/*
~/superproject → mix test ./test/superproject_test.exs:9
Compiling 1 file (.ex)
Generated superproject app
Excluding tags: [:test]
Including tags: [line: "9"]

.
Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 2 excluded
~/superproject: → mix test test/superproject_test.exs:9
Excluding tags: [:test]
Including tags: [line: "9"]

.
Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 2 excluded

Randomized with seed 553374
~/superproject → mix test --exclude test --include line:9 ./test/superproject_test.exs
Excluding tags: [:test]
Including tags: [line: "9"]

.
Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 2 excluded

Randomized with seed 220744
```

## Elixir 1.16.0

* `mix test ./test/superproject_test.exs:9` - broken
* `mix test test/superproject_test.exs:9` - functional
* `mix test --exclude test --include line:9 ./test/superproject_test.exs` - functional

```
~/superproject → elixir -v
Erlang/OTP 26 [erts-14.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

Elixir 1.16.0 (compiled with Erlang/OTP 26)
~/superproject → cat .tool-versions
elixir 1.16.0-otp-26
erlang 26.2.1
~/superproject → rm -rf _build/*
~/superproject → mix test ./test/superproject_test.exs:9
Compiling 1 file (.ex)
Generated superproject app
Excluding tags: [:test]
Including tags: [location: {"./test/superproject_test.exs", 9}]

All tests have been excluded.

Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 3 excluded

Randomized with seed 605037
~/superproject: → mix test test/superproject_test.exs:9
Compiling 1 file (.ex)
Generated superproject app
Excluding tags: [:test]
Including tags: [location: {"test/superproject_test.exs", 9}]

.
Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 2 excluded

Randomized with seed 915642
~/superproject → mix test --exclude test --include line:9 ./test/superproject_test.exs
Excluding tags: [:test]
Including tags: [line: 9]

.
Finished in 0.00 seconds (0.00s async, 0.00s sync)
3 tests, 0 failures, 2 excluded

Randomized with seed 222054
```

Fragment from `mix help test` docs in 1.16.0:

```
In case a single file is being tested, it is possible to pass one or more
specific line numbers to run only those given tests:

    $ mix test test/some/particular/file_test.exs:12

Which is equivalent to:

    $ mix test --exclude test --include line:12 test/some/particular/file_test.exs
```

## ASDF

If you use asdf you can switch between Elixir 1.16.0 and Elixir 1.15.7 by switching between git tags:

```
git checkout 1.16.0
```

or

```
git checkout 1.15.7
```
