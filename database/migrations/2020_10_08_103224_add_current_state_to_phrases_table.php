<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCurrentStateToPhrasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('phrases', function (Blueprint $table) {
            $table->enum('current_state', ['learning', 'learned', 'default'])->default('default')->after('visible');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('phrases', function (Blueprint $table) {
            $table->dropColumn(['current_state']);
        });
    }
}
