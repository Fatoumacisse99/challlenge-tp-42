<template>
  <div class="container">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" @click="loadRecette">
      Voir les détails de la recette
    </button>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Détails de la recette :</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div v-if="recette">
              <p><strong>Titre:</strong> {{ recette.titre }}</p>
              <p><strong>Ingrédients:</strong> {{ recette.ingredients }}</p>
              <p><strong>Type:</strong> {{ recette.type }}</p>
            </div>
            <div v-else>
              <p>La recette n'a pas pu être trouvée.</p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
            <button type="button" class="btn btn-primary">Compris</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRecetteStore } from '@/store/recetteStore';
import { ref } from 'vue';
import { useRoute } from 'vue-router';

const store = useRecetteStore();
const route = useRoute();
const recette = ref(null);


const loadRecette = () => {
  const id = parseInt(route.params.id, 10); 
  recette.value = store.getById(id); 
};

</script>

<style scoped>
</style>
