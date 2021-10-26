module Web.View.HelloWorldJobs.Index where
import Web.View.Prelude

data IndexView = IndexView { helloWorldJobs :: [HelloWorldJob] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={HelloWorldJobsAction}>HelloWorldJobs</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewHelloWorldJobAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>HelloWorldJob</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach helloWorldJobs renderHelloWorldJob}</tbody>
            </table>
        </div>
    |]


renderHelloWorldJob :: HelloWorldJob -> Html
renderHelloWorldJob helloWorldJob = [hsx|
    <tr>
        <td>{helloWorldJob}</td>
        <td><a href={ShowHelloWorldJobAction (get #id helloWorldJob)}>Show</a></td>
        <td><a href={EditHelloWorldJobAction (get #id helloWorldJob)} class="text-muted">Edit</a></td>
        <td><a href={DeleteHelloWorldJobAction (get #id helloWorldJob)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
