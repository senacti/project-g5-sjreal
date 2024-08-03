<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('habitaciones', function (Blueprint $table) {
            $table->integer('id_habitacion', true);
            $table->integer('habitacion_id_sucursal')->index('fk_habitaciones_sucursales1');
            $table->string('numero_habitacion', 3);
            $table->string('descripcion_habitacion', 500);
            $table->string('tipo_habitacion', 30);
            $table->integer('capacidad_habitacion');
            $table->double('precio_habitacion', null, 0);
            $table->tinyInteger('status');
            $table->tinyInteger('pet_freandlly');
            $table->integer('temporadas_id_temporada')->index('fk_habitaciones_temporadas1');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('habitaciones');
    }
};
