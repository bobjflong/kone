{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

module Lib
    ( server
    ) where

import Data.Text (Text)
import Yesod

data App = App

mkYesod "App" [parseRoutes|
  / HomeR GET
|]

instance Yesod App

getHomeR :: Handler TypedContent
getHomeR = selectRep $ provideRep $ return $ object ["message" .= message]
  where message = "hello" :: Text

server :: IO ()
server = warp 4567 App
