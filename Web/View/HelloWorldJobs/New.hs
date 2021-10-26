module Web.View.HelloWorldJobs.New where
import Web.View.Prelude

data NewView = NewView { helloWorldJob :: HelloWorldJob }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HelloWorldJobsAction}>HelloWorldJobs</a></li>
                <li class="breadcrumb-item active">New HelloWorldJob</li>
            </ol>
        </nav>
        <h1>New HelloWorldJob</h1>
        {renderForm helloWorldJob}
    |]

renderForm :: HelloWorldJob -> Html
renderForm helloWorldJob = formFor helloWorldJob [hsx|
    {(textField #status)}
    {(textField #lastError)}
    {(textField #attemptsCount)}
    {(textField #lockedBy)}
    {submitButton}
|]
