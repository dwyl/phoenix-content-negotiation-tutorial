# Phoenix Content Negotiation _Example_

A micro example showing how to return different content
for the same route based on accepts header.


## Why?

The purpose of this example is to demonstrate how simple
it is to turn _any_ Phoenix Web App into a REST API
using the _same_ routes.

## What?

In our
[App](https://github.com/dwyl/app)
we want to ensure that


Before you attempt to use the **`auth_plug`**,
try the Heroku example version so you know what to expect:
https://auth-plug-example.herokuapp.com/admin

![auth_plug_example](https://user-images.githubusercontent.com/194400/80765920-154eb600-8b3c-11ea-90d4-a64224d31a5b.png)



## Who?

This example is for us @dwyl who will be using **`auth_plug`**
in all our projects and more specifically for our
[`App`](https://github.com/dwyl/app).
But we have made it as _generic_ as possible
to show that _anyone_ can use (an instance of the) Auth Service
to add Auth to _any_ app in less than 2 minutes!



## How?

### 1. Create New Phoenix App

```
mix phx.new app --no-ecto --no-webpack
```
When asked if you want to `Fetch and install dependencies? [Yn]`
Type <kbd>Y</kbd> followed by the <kbd>Enter</kbd> key.

> This example only needs the bare minimum Phoenix;
we don't need any JavaScript or Database. <br />
For more info, see:
https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html <br />
> The beauty is that this simple use-case
is identical to the advanced one.
Once you understand these basic principals,
you "grock" how to use `auth_plug` _anywhere_!


Change into the `app` directory (`cd app`)
and open the project in your text editor (or IDE). <br />
e.g: `atom .`



```
mix phx.new app --no-ecto --no-webpack
```


We default to calling our app "App" for simplicity.
Some people prefer other names we like this one.
