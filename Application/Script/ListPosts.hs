#!/usr/bin/env run-script
module Application.Script.ListPosts where

import Application.Script.Prelude

run :: Script
run = do
    posts <- query @Post |> fetch

    forEach posts \post -> do
        putStrLn (get #title post)
