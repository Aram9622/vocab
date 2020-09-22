<?php

namespace App\Http\Controllers\Traits;

trait Image
{
    public function getImagePath($dir, $thumb = false, callable $callback = null)
    {
        $dir .= $thumb ? '/thumb' : '';
        $imagePath = public_path("uploads/$dir/{$this->image}");

        if (is_file($imagePath) && $callback) {
            $callback($imagePath);
        }
    }

    public function getAudioPath($lang = 'en')
    {
        $column = "record_$lang";
        $audioPath = public_path("uploads/audio/{$this->$column}");
        return $audioPath;
    }

    public function deleteAudios()
    {
        if (is_file($audio = $this->getAudioPath('en'))) {
            unlink($audio);
        }

        if (is_file($audio = $this->getAudioPath('es'))) {
            unlink($audio);
        }
    }

    public function getCategoriesImagePath($image = false, $thumb = false, callable $callback = null)
    {
        if ($this->level == null) {
            $image_path = 'uploads/categories/' . $this->type;
        } else {
            $image_path = 'uploads/categories/' . $this->type . '/' . $this->level;
        }

        if ($thumb === true) {
            $image_path .= '/thumb';
        }

        $path = public_path($image ? $image_path . '/' . $this->image : $image_path);

        if ($image === true && $callback && is_file($path)) {
            $callback($path);
        }

        return $path;
    }

    public function deleteAllRelatedCatImages($model = null)
    {
        $model = $model ?: $this;

        $model->getCategoriesImagePath(true, false, function ($image) {
            unlink($image);
        });

        $model->getCategoriesImagePath(true, true, function ($image) {
            unlink($image);
        });

        $ManyToManyRelations = ['conversations', 'words', 'news', 'phrases', 'verbs'];

        foreach ($ManyToManyRelations as $relation) {
            if (!$this->$relation || empty($this->$relation)) continue;

            foreach ($this->$relation as $relModel) {
                $relModel->delete();
            }
        }

        if ($model->parentOne) {
            $this->deleteAllRelatedCatImages($model->parentOne);
        }
    }
}