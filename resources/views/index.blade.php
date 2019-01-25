<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>API</title>
    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <h1>Search similar words<h1>
    <!-- POST method for input word -->
    <form method="POST" action="{{route('data')}}">
        @csrf
        <input type="text" placeholder="Enter a word..." name="word" autofocus>
        <button type="submit">Request data</button>
    </form>

</body>
</html>