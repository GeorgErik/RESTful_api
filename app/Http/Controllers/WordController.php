<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Word;

class WordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    // Returns index view(index.blade.php) to user
    public function index(){
        return view('index');
    }
    // Request function 
    public function data(Request $request){
        // Variable $sentWord stores input data
        $sentWord = $request->word;

        // Database function for selecting words from database and comparing them with input word via levenshetin funtion
        $words = DB::select("SELECT * FROM `words` WHERE levenshtein('$sentWord', `word`) BETWEEN 0 AND 3 LIMIT 10");

        // Sending user the view(result.blade.php) with database result
        return view('result')->with('words', $words)->with('sentWord', $sentWord);
    }
   
}
