module Main 
  where
import System.IO
import Data.List

extractFields :: String -> [String]
extractFields [] = []
extractFields record = currentField:currentList
  where
  currentField = extractToComma record
  currentList = extractFields (drop ((length currentField)+1) record)

extractToComma :: String -> String
extractToComma s = takeWhile (/=',') s

removeCarraigeReturn :: String -> String
removeCarraigeReturn s = if isSuffixOf "\r" s 
  then take ((length s)-1) s
  else s
  
main = do
  file <- readFile "Presidents.csv"
  --mapM_ putStrLn (lines file)
  print (extractFields $ removeCarraigeReturn $ head $ lines $ file)
  putStrLn "Test"
  

