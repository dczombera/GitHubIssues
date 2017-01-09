# Issues

GitHubIssues is a command line tool that parses the passed arguments and fetches the requested number of issues of given project. It Generates a formatted table of the last _n_ issues.
This project's goal was to learn more about Elixir and its tools.

## Make a command-line executable

If you want to order to run the application from the command line, make sure Erlang is installed.
When you are ready to go, do the following steps:

1. In the project's folder, packe the program using mix:

  ```elixir
  $ mix escript.build
  ```

2. Now you should fasten your seat belt. You can execute the app passing it
   the GitHub user name and the name of the project. Optionally, you can also
   pass the number of issues you want to fetch

  ```elixir
  $ ./issues help
  usage: issues <user> <project> [ count | 4 ]
  ```

3. A formatted table of the project's issues is printed.

  ```elixir
  $ ./issues reactjs redux 10
  numb | created_at           | title
  -----+----------------------+----------------------------------------------------------------------
  1352 | 2016-02-02T15:49:49Z | "Scope" doc
  1353 | 2016-02-02T18:55:37Z | Real world examples (including CRUD, advanced patterns, etc)
  1354 | 2016-02-02T22:12:50Z | Update TodoMVC example to be more in line with other examples
  1366 | 2016-02-04T21:50:30Z | Official example with Redux Saga
  1398 | 2016-02-14T02:37:44Z | passing a invalid reducer to combineReducers() silently fails
  1462 | 2016-02-29T10:53:30Z | Improve documentation on unit testing redux components
  1528 | 2016-03-18T02:29:12Z | Reducer Composition with Effects in JavaScript
  1617 | 2016-04-14T20:17:45Z | Document required default state in reducer
  1636 | 2016-04-19T10:29:40Z | Redux.replaceReducer throw warning "Unexpected key found"
  1648 | 2016-04-20T11:58:56Z | TypeScript definition for StoreEnhancer prevents state type extension
  ```


## Create Documentation

To generate a documentation of this project using Elixir's `ExDoc`, run following:

  ```elixir
  $ mix docs
  Docs successfully generated.
  View them at "doc/index.html".  
  ```

After the docs were successfully created, you can view them in your browser at `doc/index.html`


![alt ExDoc](https://cloud.githubusercontent.com/assets/2528506/21761556/1ec95852-d654-11e6-9f0f-85205623752d.png) 
