module Web.Job.HelloWorld where
import Web.Controller.Prelude

instance Job HelloWorldJob where
    perform HelloWorldJob { .. } = do
        putStrLn "Hello World!"
