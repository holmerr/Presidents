module Main 
  where
import System.IO

extractFields :: String -> [String]
extractFields [] = []
extractFields record = currentField:currentList
  where
  currentField = extractToComma record
  currentList = extractFields (drop ((length currentField)+1) record)

extractToComma :: String -> String
extractToComma s = takeWhile (/=',') s

main = do
  file <- readFile "Presidents.csv"
  --mapM_ putStrLn (lines file)
  print (extractFields (head $ lines $ file))
  

    