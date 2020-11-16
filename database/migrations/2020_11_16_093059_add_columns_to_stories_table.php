<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToStoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('stories', function (Blueprint $table) {
            $table->string('sub_title_en')->nullable()->after('record_es');
            $table->string('sub_title_es')->nullable()->after('sub_title_en');
            $table->string('description_en')->nullable()->after('sub_title_es');
            $table->string('description_es')->nullable()->after('description_en');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('stories', function (Blueprint $table) {
            $table->dropColumn(['sub_title_en', 'sub_title_es', 'description_en', 'description_es']);
        });
    }
}
