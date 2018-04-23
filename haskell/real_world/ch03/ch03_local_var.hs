avg :: Fractional a => [a] -> a
avg xs =
  let sm = sum xs
      ln = fromIntegral $ length xs in
  sm / ln
