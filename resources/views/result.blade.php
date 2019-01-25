<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Result</title>
    <style>
        * {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <p><a href="{{URL::previous()}}">Go Back</a></p>
    <h1>Results from searching the word '{{$sentWord}}'</h1>
    <p>Closest words: </p>
    <!-- Using foreach method to echo data from DB object(WordController.php) -->
    @foreach($words as $word)
        <p><strong>{{$word->word}}</strong></p> 
    @endforeach
</body>
</html>