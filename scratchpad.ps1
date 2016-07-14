
break

# Converting my csv to JSON
Import-Csv .\data\evolve.csv | %{
    New-Object psobject -Property ([ordered]@{
        Pokemon = $_.Pokemon
        Candy = $_.Candy
        EvolveTo = [string[]](
            $_.EvolveTo1,$_.EvolveTo2,$_.EvolveTo3 |
            Where-Object { $_ -ne "" }
        )
    })
}