<?php

namespace App\Http\Controllers\Traits;

trait Image
{
    public $showAssetPath = false;

    public function getImagePath($dir, $thumb = false, callable $callback = null)
    {
        $dir .= $thumb ? '/thumb' : '';

        if ($this->showAssetPath === true) {
            return asset("uploads/$dir/{$this->image}");
        }

        $imagePath = public_path("uploads/$dir/{$this->image}");

        if (is_file($imagePath) && $callback) {
            $callback($imagePath);
        }

        return $imagePath;
    }

    public function getAudioPath($lang = 'en')
    {
        $column = "record_$lang";

        if (!$this->$column) return null;

        $audioPath = $this->showAssetPath === true ? asset("uploads/audio/{$this->$column}") : public_path("uploads/audio/{$this->$column}");

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
        $level = $this->level;
        $type = $this->type;

        if ($this->category_id) {
            $level = $this->category->level;
            $type = $this->category->type;
        }

        if ($level == null) {
            $image_path = 'uploads/categories/' . $type;
        } else {
            $image_path = 'uploads/categories/' . $type . '/' . $level;
        }

        if (isset($this->category) && isset($this->category->parent)) {
            $image_path = 'uploads/' . $type;
        }

        if ($thumb === true) {
            $image_path = '/uploads/thumb';
        }

        $path = $image ? $image_path . '/' . $this->image : $image_path;

        if ($this->showAssetPath === true) {
            return asset($path);
        }

        $path = public_path($path);

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

        $ManyToManyRelations = ['conversations', 'words', 'news', 'phrases', 'verbs', 'exercises'];

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
