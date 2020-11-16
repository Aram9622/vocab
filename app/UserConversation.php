<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserConversation extends Model
{
    protected $fillable = ['conversation_id', 'user', 'text_en', 'text_es'];

    public function users_conversations()
    {
        return $this->hasMany(UserConversation::class, 'conversation_id', 'id');
    }
}
