defmodule Issues.TableFormatter do
  import Enum, only: [ each: 2, map: 2, map_join: 3, max: 1 ]

  @doc """
  Takes a row data (each row is a map) and a list of headers.
  Prints a formatted table to STDOUT of the data from each row
  identified by each header. Each header identifies a column and those
  columns are extracted and printed.
  We calculate the width of each column to fit the longest element in
  each column
  """
  def print_table_for_columns(rows, headers) do
    with data_by_columns = split_into_columns(rows, headers),
         column_widths   = widths_of(data_by_columns),
         format          = format_for(column_widths)
    do
      puts_one_line_in_columns(headers, format)
      IO.puts(seperator(column_widths))
      puts_in_columns(data_by_columns, format)
    end
  end

  @doc """
  Given a list of rows, where each row contains a keyed list of columns,
  return a list containing lists of the data of each column. The `headers`
  parameter containts a list of columns to extract.
  ## Example
    iex> list = [Enum.into([{"a", "1"},{"b", "2"},{"c", "3"}], %{}),
    ...> Enum.into([{"a", "4"},{"b", "5"},{"c", "6"}], %{})]
    iex> Issues.TableFormatter.split_into_columns(list, [ "a", "b", "c" ])
    [ ["1", "4"], ["2", "5"], ["3", "6"] ]
  """
  def split_into_columns(rows, headers) do
    for header <- headers do
      for row <- rows, do: printable(row[header])
    end
  end

  @doc """
  Return a binary(string) version of our parameter.
  ## Example
    iex> Issues.TableFormatter.printable("a")
    "a"
    iex> Issues.TableFormatter.printable(99)
    "99"
  """
  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)

  @doc """
  Given a list of sublists, where each sublist contains the data for a column,
  return a list containt the maximum width of each column.
  ## Example
    iex> data = [[ "han", "luke", "leia"], [ "vader", "palpatine", "tarkin" ]]
    iex> Issues.TableFormatter.widths_of(data)
    [ 4, 9 ]
  """
  def widths_of(columns) do
    for column <- columns, do: column |> map(&String.length/1) |> max
  end

  @doc """
  Return a format string that contais the widths of a set of columns.
  We put ` | ` between each column.
  ## Example
    iex> widths = [ 42, 13, 37 ]
    iex> Issues.TableFormatter.format_for(widths)
    "~-42s | ~-13s | ~-37s~n"
  """
  def format_for(column_widths) do
    map_join(column_widths, " | ", fn width -> "~-#{width}s" end) <> "~n"
  end

  @doc """
  Generate a line that goes below the column headings. It is a string of
  hyphens with plus signs where the vertical bar between the columns goes.
  ## Example
    iex> widths = [ 4, 5, 6 ]
    iex> Issues.TableFormatter.seperator(widths)
    "-----+-------+-------"
  """
  def seperator(column_widths) do
    map_join(column_widths, "-+-", &(List.duplicate("-", &1)))
  end

  @doc """
  Given a list of rows of data, a list containt the header selectors
  and a format string, print the extracted data under control
  of the format string.
  """
  def puts_in_columns(data_by_columns, format) do
    data_by_columns
    |> List.zip
    |> map(&Tuple.to_list/1)
    |> each(&puts_one_line_in_columns(&1, format))
  end

  def puts_one_line_in_columns(fields, format) do
    :io.format(format, fields)
  end
end
