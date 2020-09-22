<?php

namespace App\Http\Controllers\Traits;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

trait FileUploadTrait
{

    /**
     * File upload trait used in controllers to upload files
     */
    public static function saveFiles(Request $request, $path = null, $w = null, $h = null)
    {
        if($path != null){
            $path = 'uploads/'.$path;
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
        }else {
            $path = 'uploads';
        }
        $newRequest = null; // Variable to hold a new request created by above array merging
        foreach ($request->all() as $key => $value) {
            if ($request->hasFile($key) && explode('/', $request->$key->getMimeType())[0] == 'image') {
                if ($request->has($key . '_w') && $request->has($key . '_h')) {
                    // Check file width
                    $filename = time() . '-' . $request->file($key)->getClientOriginalName();
                    $file     = $request->file($key);
                    $image    = Image::make($file);
                    Image::make($file)->resize(50, 50)->save(public_path('uploads/thumb') . '/' . $filename);
                    $width  = $image->width();
                    $height = $image->height();
                    if ($width > $request->{$key . '_w'} && $height > $request->{$key . '_h'}) {
                        $image->resize($request->{$key . '_w'}, $request->{$key . '_h'});
                    } elseif ($width > $request->{$key . '_w'}) {
                        $image->resize($request->{$key . '_w'}, null, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                    } elseif ($height > $request->{$key . '_w'}) {
                        $image->resize(null, $request->{$key . '_h'}, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                    }
                    $image->save(public_path($path) . '/' . $filename);
                    // Determine which request's data to use further
                    $requestDataToMerge = $newRequest == null ? $request->all() : $newRequest->all();
                    // Create new request without changing the original one (prevents removal of specific metadata which disables parsing of a second file)
                    $newRequest = new Request(array_merge($requestDataToMerge, [$key => $filename]));
                } else if($w != null && $h != null){
                    // Check file width
                    $filename = time() . '-' . $request->file($key)->getClientOriginalName();
                    $file     = $request->file($key);
                    $image    = Image::make($file);
                    Image::make($file)->resize(50, 50)->save(public_path('uploads/thumb') . '/' . $filename);
                    $width  = $image->width();
                    $height = $image->height();
                    if ($width > $w && $height > $h) {
                        $image->resize($w, $h);
                    } elseif ($width > $w) {
                        $image->resize($w, null, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                    } elseif ($height > $w) {
                        $image->resize(null, $h, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                    }
                    $image->save(public_path($path) . '/' . $filename);
                    // Determine which request's data to use further
                    $requestDataToMerge = $newRequest == null ? $request->all() : $newRequest->all();
                    // Create new request without changing the original one (prevents removal of specific metadata which disables parsing of a second file)
                    $newRequest = new Request(array_merge($requestDataToMerge, [$key => $filename]));

                }else{
                    if(is_array($request->file($key))){
                        $imageNames = [];
                        foreach ($request->file($key) as $k => $imageArray) {
                            $filename = time() . '-' . $imageArray->getClientOriginalName();
                            $imageNames[] = $filename;
                            $file     = $request->file($key)[$k];
                            // $imageArray->move(public_path($path), $filename);
                            $image    = Image::make($file);
                            Image::make($file)->resize(50, 50)->save(public_path('uploads/thumb') . '/' . $filename);

                            $image->save(public_path($path) . '/' . $filename);
                            // Determine which request's data to use further
                            $requestDataToMerge = $newRequest == null ? $request->all() : $newRequest->all();
                            // Create new request without changing the original one (prevents removal of specific metadata which disables parsing of a second file)
                            $newRequest = new Request(array_merge($requestDataToMerge, [$key => $imageNames]));
                        }
                    }else {
                        $filename = time() . '-' . $request->file($key)->getClientOriginalName();
                        $file     = $request->file($key);
                        $image    = Image::make($file);
                        Image::make($file)->resize(50, 50)->save(public_path('uploads/thumb') . '/' . $filename);
                        // Determine which request's data to use further
                        $image->save(public_path($path) . '/' . $filename);
                        $requestDataToMerge = $newRequest == null ? $request->all() : $newRequest->all();
                        // Create new request without changing the original one (prevents removal of specific metadata which disables parsing of a second file)
                        $newRequest = new Request(array_merge($requestDataToMerge, [$key => $filename]));
                    }
                }
            }
        }
        return $newRequest == null ? $request : $newRequest;
    }
}
