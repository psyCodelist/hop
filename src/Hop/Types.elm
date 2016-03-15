module Hop.Types (..) where

import Dict
import Task exposing (Task)
import Combine exposing (Parser)


--type Action
--  = GoToRouteResult (Result () ())


type alias Query =
  Dict.Dict String String


type alias Url =
  { path : List String
  , query : Query
  }


type alias Route action =
  { parser : Parser action
  , segments : List String
  }


type alias Config actionTag routeTag =
  { action : ( routeTag, Url ) -> actionTag
  , notFound : routeTag
  , routes : List (Route routeTag)
  }


type alias Router actionTag =
  { signal : Signal actionTag
  , run : Task () ()
  , url : Url
  }