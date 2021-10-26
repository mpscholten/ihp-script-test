module Web.Controller.HelloWorldJobs where

import Web.Controller.Prelude
import Web.View.HelloWorldJobs.Index
import Web.View.HelloWorldJobs.New
import Web.View.HelloWorldJobs.Edit
import Web.View.HelloWorldJobs.Show

instance Controller HelloWorldJobsController where
    action HelloWorldJobsAction = do
        helloWorldJobs <- query @HelloWorldJob |> fetch
        render IndexView { .. }

    action NewHelloWorldJobAction = do
        let helloWorldJob = newRecord
        render NewView { .. }

    action ShowHelloWorldJobAction { helloWorldJobId } = do
        helloWorldJob <- fetch helloWorldJobId
        render ShowView { .. }

    action EditHelloWorldJobAction { helloWorldJobId } = do
        helloWorldJob <- fetch helloWorldJobId
        render EditView { .. }

    action UpdateHelloWorldJobAction { helloWorldJobId } = do
        helloWorldJob <- fetch helloWorldJobId
        helloWorldJob
            |> buildHelloWorldJob
            |> ifValid \case
                Left helloWorldJob -> render EditView { .. }
                Right helloWorldJob -> do
                    helloWorldJob <- helloWorldJob |> updateRecord
                    setSuccessMessage "HelloWorldJob updated"
                    redirectTo EditHelloWorldJobAction { .. }

    action CreateHelloWorldJobAction = do
        let helloWorldJob = newRecord @HelloWorldJob
        helloWorldJob
            |> ifValid \case
                Left helloWorldJob -> render NewView { .. } 
                Right helloWorldJob -> do
                    helloWorldJob <- helloWorldJob |> createRecord
                    setSuccessMessage "HelloWorldJob created"
                    redirectTo HelloWorldJobsAction

    action DeleteHelloWorldJobAction { helloWorldJobId } = do
        helloWorldJob <- fetch helloWorldJobId
        deleteRecord helloWorldJob
        setSuccessMessage "HelloWorldJob deleted"
        redirectTo HelloWorldJobsAction

buildHelloWorldJob helloWorldJob = helloWorldJob
    |> fill @["status","lastError","attemptsCount","lockedBy"]
