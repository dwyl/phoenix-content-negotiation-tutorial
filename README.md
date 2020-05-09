<div align="center">

# Phoenix Content Negotiation _Tutorial_

A tutorial showing how to return different content
for the same route based on `Accepts` header.

</div>

## Why? 🤷

The purpose of this tutorial is to demonstrate how simple
it is to turn _any_ Phoenix Web App into a REST API
using the _same_ URI.



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
_any_ request that can be made in the UI
has a corresponding JSON response
without any _duplication_ of _effort_.
We _definitely_ don't want to have to
run/maintain two _separate_ Phoenix Apps
as we know (_from experience_)
that the functionality will diverge
almost immediately
as a contributor who is building their own UI
will make an API-focussed addition and _forget_
to add the corresponding web UI (_or vice versa_).
We don't want to have to "_police_" the PRs
or _force_ anyone to have to write the same code twice.
We want a JSON response to be _automatically_ available
for every route and never have to think about it.
We want _anyone_ to be able to build an App/UI
using our API.



### What _Is_ Content Negotiation? 💭

> _**Content negotiation** is the process of selecting
the best representation for a given response
when there are multiple representations available._"
~ [RFC 2616/7231](https://tools.ietf.org/html/rfc7231#section-3.4)

The gist is that depending on the `Accept` header
specified by the requesting agent (e.g. a Web Browser or script),
a different _representation_ of the content can be returned.


If the concept of HTTP content negotiation is new to you,
we suggest you read the detailed article on MDN (5 mins):
https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation


### _Try_ It! 💻

_Before_ you attempt to follow the example,
Try the Heroku example version so you know what to expect.


#### Browser 📱

Visit:

Random

By ID:





#### Terminal ⬛

Run the following command:





## Who?


This example aimed at _anyone_ building a Phoenix App
who wants to _automatically_ have a REST API.
For us @dwyl
who are building our API and App Web UI simultaneously,
it serves as a gentle intro to the topic.

If you get stuck or have _any_ questions,
please
[ask](https://github.com/nelsonic/phoenix-content-negotiation-example/issues)

<br />

## How?

### Prerequisites?

This example assumes you have `Elixir` and `Phoenix`
installed on your computer
and that you have some _basic_ familiarity
with the language and framework respectively.
If you are totally new to either of these,
we recommend you _first_ read:
[github.com/dwyl/**learn-elixir**](https://github.com/dwyl/learn-elixir)
and
[github.com/dwyl/**learn-phoenix-framework**](https://github.com/dwyl/learn-phoenix-framework)

Ideally follow the "Chat" example
for more detailed step-by-step introduction to Phoenix:
[github.com/dwyl/**phoenix-chat-example**](https://github.com/dwyl/phoenix-chat-example)

Once you are comfortable with Phoenix, proceed with this example!


### 1. Create New Phoenix App

In your terminal, run the following command to create a new app:


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
you "grock" how to use Content Negotiation in a more advanced app.

> **Note**: We default to calling _all_ our apps "App" for simplicity.
Some people prefer other more elaborate names. We like this one.


Change into the `app` directory (`cd app`)
and open the project in your text editor (or IDE). <br />
e.g: `atom .`

#### 1.1 Check That Everything _Works_

_Before_ diving in to add any features to our app,
let's check that it _works_.
Run the server in your terminal:

```sh
mix phx.server
```

Then visit [`localhost:4000`](http://localhost:4000) in your web browser. <br />
You should see something like this (_the default Phoenix home page_):

![phoenix-homepage-default](https://user-images.githubusercontent.com/194400/81491226-cfa09480-9283-11ea-9d3b-4687b3f4aae4.png)


Having confirmed that the UI works,
let's run the tests:

```
mix test
```



### 2
