module Web.View.HelloWorldJobs.Edit where
import Web.View.Prelude

data EditView = EditView { helloWorldJob :: HelloWorldJob }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HelloWorldJobsAction}>HelloWorldJobs</a></li>
                <li class="breadcrumb-item active">Edit HelloWorldJob</li>
            </ol>
        </nav>
        <h1>Edit HelloWorldJob</h1>
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
