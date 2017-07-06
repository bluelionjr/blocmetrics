# README

# Blocmetrics

Blocmetrics is an analytics service to track events on websites with a few key features:

1. A client-side JavaScript snippet that allows a user to track events on their website.

2. A server-side API that captures and saves those events to a database.

3. A Rails application that displays the captured event data for a user.

# Getting Started

1. Sign up for Blocmetrics and register your website/application.

2. Add the following JavaScript to the application you want to track:

```javascript
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    // Create event JSON object to send to Blocmetrics analytics service
    var event = {event: { name: eventName }};
    // Initialize a new AJAX request
    var request = new XMLHttpRequest();
    // Set the HTTP method to POST, the url of our events endpoint, and allow the request to run asynchronously
    request.open("POST", "http://localhost:3000/api/events", true);
    // Set the request Content-Type header
    request.setRequestHeader('Content-Type', 'application/json');
    // Send the request
    request.send(JSON.stringify(event));
  };
```

3. Add the following code to the bottom of the pages on which you want to track events.  Replace 'Your Page' with a name that's relevant for you.

```javascript
<script type="text/javascript">
     $(document).on("ready page:load", function () {
        blocmetrics.report("Your Page");
      })
</script>
```

4. Grab a beverage, sign in to Blocmetrics, click on your application, and watch the events roll in.


* Ruby version 2.4.0p0

* Rails version 5.0.4
