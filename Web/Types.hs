module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data PostsController
    = PostsAction
    | NewPostAction
    | ShowPostAction { postId :: !(Id Post) }
    | CreatePostAction
    | EditPostAction { postId :: !(Id Post) }
    | UpdatePostAction { postId :: !(Id Post) }
    | DeletePostAction { postId :: !(Id Post) }
    deriving (Eq, Show, Data)

data HelloWorldJobsController
    = HelloWorldJobsAction
    | NewHelloWorldJobAction
    | ShowHelloWorldJobAction { helloWorldJobId :: !(Id HelloWorldJob) }
    | CreateHelloWorldJobAction
    | EditHelloWorldJobAction { helloWorldJobId :: !(Id HelloWorldJob) }
    | UpdateHelloWorldJobAction { helloWorldJobId :: !(Id HelloWorldJob) }
    | DeleteHelloWorldJobAction { helloWorldJobId :: !(Id HelloWorldJob) }
    deriving (Eq, Show, Data)
