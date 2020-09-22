<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExercisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exercises', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id')->nullable();
            $table->tinyInteger('type')->default(1)->nullable();
            $table->tinyInteger('visible')->default(1)->nullable();
            $table->string('words')->nullable();
            $table->string('image')->nullable();
            $table->string('title');
            $table->string('record_en')->nullable();
            $table->string('record_es')->nullable();
            $table->text('exercise_en');
            $table->text('exercise_es');
            $table->timestamps();
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exercises');
    }
}
