# Phoenix Content Negotiation _Example_

A micro example showing how to return different content
for the same route based on accepts header.


## Why? 🤷

The purpose of this example is to demonstrate how simple
it is to turn _any_ Phoenix Web App into a REST API
using the _same_ routes.

### Goal? 🎯

Our goal is:
to run the _same_ Phoenix Application for both our Web UI and REST API
and _transparently_ return the appropriate content (HTML or JSON)
based on the `Accept` header.

So a request made in a **Web Browser** will display HTML
whereas a cURL command in a terminal
(_or request from any other Frontend-only App_)
will return JSON for the _same_ URL.

That way we ensure that _all_ routes in our App
have the equivalent JSON response
so _every_ action can be performed _programatically_.
Which means anyone can build their _own_ Frontend UI/UX.
We believe this is _crucial_ to the success of our product.
We think the API _is_ our Product and the Web UI
is just _one_ representation of what is _possible_.


## What? 💡

In our
[App](https://github.com/dwyl/app)
we want to ensure that



### What _Is_ Content Negotiation? 💭

> _**Content negotiation** is the process of selecting
the best representation for a given response
when there are multiple representations available._"
~ [RFC 2616/7231](https://tools.ietf.org/html/rfc7231#section-3.4)

The gist is that depending on the `Accept` header
specified by the requesting agent (e.g. a Web Browser or script),
a different _representation_ of the content can be returned.



If the concept of HTTP content negotiation is new to you,
we suggest you read the detailed article on MDN:
https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation

### _Try_ It! 💻

_Before_ you attempt to follow the example,
Try the Heroku example version so you know what to expect:


#### Browser 📱

Visit:




#### Terminal ⬛

Run the following command:





## Who?


This example is for us @dwyl
who will be building our API and App Web UI simultaneously.


will be using **`auth_plug`**
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
