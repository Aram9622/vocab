<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ImageToFlashcardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('flashcard_groups', function (Blueprint $table) {
            if (Schema::hasColumn('flashcards', 'image') === false) {
                $table->string('image');
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('flashcard_groups', function (Blueprint $table) {
            if (Schema::hasColumn('flashcards', 'image') === true) {
                $table->dropColumn(['image']);
            }
        });
    }
}
