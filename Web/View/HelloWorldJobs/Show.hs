module Web.View.HelloWorldJobs.Show where
import Web.View.Prelude

data ShowView = ShowView { helloWorldJob :: HelloWorldJob }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HelloWorldJobsAction}>HelloWorldJobs</a></li>
                <li class="breadcrumb-item active">Show HelloWorldJob</li>
            </ol>
        </nav>
        <h1>Show HelloWorldJob</h1>
        <p>{helloWorldJob}</p>
    |]
