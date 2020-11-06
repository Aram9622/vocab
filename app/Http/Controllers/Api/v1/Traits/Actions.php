<?php

namespace App\Http\Controllers\Api\v1\Traits;

use App\Traits\ModelFactory;

trait Actions
{
    use ModelFactory {
        modelFactory as public factory;
    }

    public function correctAttributes(&$model)
    {
        try {
            $type = $this->getFactoryType($model);

            if (!in_array($type, ['words', 'flashcards', 'flashcard_groups']) && !$model->words_en && !$model->words_es) {
                $model->word_en = $model->conversation_en ?: $model->exercise_en ?: $model->phrase_en ?: $model->story_en ?: $model->verb_en ?: null;
                $model->word_es = $model->conversation_es ?: $model->exercise_es ?: $model->phrase_es ?: $model->story_es ?: $model->verb_es ?: null;
            }
        } catch (\Exception $e) {

        }
    }

}
