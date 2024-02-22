defmodule Kata04 do

def pick_challenge()do
  IO.puts("This is the Kata04 challenge (Data Munging), to specify which part you want to run enter\n")

  IO.puts("The solution for the part 1 is:")
  IO.inspect(convert_to_matrix("files/weather.csv", [0,1,2]))
  IO.puts("\n")
  IO.puts("The solution for the part 2 is:")
  IO.inspect(convert_to_matrix("files/football.csv", [0,5,6]))

end

defp convert_to_matrix(file_path, indexes) do

  contents = File.read!(file_path)

  rows= String.split(contents,"\n")

  columns= rows |> Enum.map(fn row ->
    String.split(row,",")
  end)

  access_columns(columns,indexes)

end

defp access_columns(columns, indexes)do
filtered_columns = Enum.map(columns, fn row ->
  Enum.map(indexes, &Enum.at(row, &1))
end)

get_difference(filtered_columns)
end


defp get_difference(columns) do
  target_columns = Enum.map(columns, fn [col1, col2, col3] ->
    {col1, abs(String.to_integer(col2) - String.to_integer(col3))}
  end)

 get_smallest(target_columns)
end


defp get_smallest(columns) do
  {identifier,smallest} = Enum.min_by(columns, fn {_identifier,difference}
  -> difference
end)


{identifier,smallest}
end


end
