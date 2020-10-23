<?php

namespace App\Traits;

use App\Models\Conversation;
use App\Models\Exercise;
use App\Models\Phrase;
use App\Models\Story;
use App\Models\Verb;
use App\Models\Word;

/**
 * Trait ModelFactory
 * @package App\Traits
 */
trait ModelFactory
{
    /**
     * @param $type
     * @return Conversation|Exercise|Phrase|Story|Verb|Word|null
     */
    public function modelFactory($type)
    {
        $model = null;

        switch ($type) {
            case "words":
                $model = new Word();
                break;
            case "phrases":
                $model = new Phrase();
                break;
            case "verbs":
                $model = new Verb();
                break;
            case "stories":
                $model = new Story();
                break;
            case "conversations":
                $model = new Conversation();
                break;
            case "exercises":
                $model = new Exercise();
                break;
        }

        return $model;
    }
}
