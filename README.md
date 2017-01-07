# Issues

**TODO: Add description**

Parses the command line arguments and fetches the requested number of issues of given project. Generates a table of the last _n_ issues.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

1. Add `issues` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
  [{:issues, "~> 0.1.0"}]
  end
  ```

2. Ensure `issues` is started before your application:

  ```elixir
  def application do
  [applications: [:issues]]
  end
  ```
