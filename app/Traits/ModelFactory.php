<?php

namespace App\Traits;

use App\Flashcard;
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
            case "flashcards":
                $model = new Flashcard();
                break;
        }

        return $model;
    }

    public function getFactoryType($model)
    {
        $type = 'words';

        if ($model instanceOf Phrase) {
            $type = 'phrases';
        }

        if ($model instanceOf Verb) {
            $type = 'verbs';
        }

        if ($model instanceOf Story) {
            $type = 'stories';
        }

        if ($model instanceOf Conversation) {
            $type = 'conversations';
        }

        if ($model instanceOf Exercise) {
            $type = 'exercises';
        }

        if ($model instanceOf Flashcard) {
            $type = 'flashcards';
        }

        return $type;
    }
}
